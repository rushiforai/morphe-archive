.class public final Lnicoid/network238/okio/Okio;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "nicoid/network238/okio/Okio__JvmOkioKt",
        "nicoid/network238/okio/Okio__OkioKt",
        "nicoid/network238/okio/Okio__ZlibOkioKt"
    }
    k = 0x4
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final appendingSink(Ljava/io/File;)Lnicoid/network238/okio/Sink;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__JvmOkioKt;->appendingSink(Ljava/io/File;)Lnicoid/network238/okio/Sink;

    move-result-object p0

    return-object p0
.end method

.method public static final asResourceFileSystem(Ljava/lang/ClassLoader;)Lnicoid/network238/okio/FileSystem;
    .registers 1

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__JvmOkioKt;->asResourceFileSystem(Ljava/lang/ClassLoader;)Lnicoid/network238/okio/FileSystem;

    move-result-object p0

    return-object p0
.end method

.method public static final blackhole()Lnicoid/network238/okio/Sink;
    .registers 1

    .line 1
    invoke-static {}, Lnicoid/network238/okio/Okio__OkioKt;->blackhole()Lnicoid/network238/okio/Sink;

    move-result-object v0

    return-object v0
.end method

.method public static final buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;
    .registers 1

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__OkioKt;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p0

    return-object p0
.end method

.method public static final buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;
    .registers 1

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__OkioKt;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object p0

    return-object p0
.end method

.method public static final cipherSink(Lnicoid/network238/okio/Sink;Ljavax/crypto/Cipher;)Lnicoid/network238/okio/CipherSink;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__JvmOkioKt;->cipherSink(Lnicoid/network238/okio/Sink;Ljavax/crypto/Cipher;)Lnicoid/network238/okio/CipherSink;

    move-result-object p0

    return-object p0
.end method

.method public static final cipherSource(Lnicoid/network238/okio/Source;Ljavax/crypto/Cipher;)Lnicoid/network238/okio/CipherSource;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__JvmOkioKt;->cipherSource(Lnicoid/network238/okio/Source;Ljavax/crypto/Cipher;)Lnicoid/network238/okio/CipherSource;

    move-result-object p0

    return-object p0
.end method

.method public static final hashingSink(Lnicoid/network238/okio/Sink;Ljava/security/MessageDigest;)Lnicoid/network238/okio/HashingSink;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__JvmOkioKt;->hashingSink(Lnicoid/network238/okio/Sink;Ljava/security/MessageDigest;)Lnicoid/network238/okio/HashingSink;

    move-result-object p0

    return-object p0
.end method

.method public static final hashingSink(Lnicoid/network238/okio/Sink;Ljavax/crypto/Mac;)Lnicoid/network238/okio/HashingSink;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__JvmOkioKt;->hashingSink(Lnicoid/network238/okio/Sink;Ljavax/crypto/Mac;)Lnicoid/network238/okio/HashingSink;

    move-result-object p0

    return-object p0
.end method

.method public static final hashingSource(Lnicoid/network238/okio/Source;Ljava/security/MessageDigest;)Lnicoid/network238/okio/HashingSource;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__JvmOkioKt;->hashingSource(Lnicoid/network238/okio/Source;Ljava/security/MessageDigest;)Lnicoid/network238/okio/HashingSource;

    move-result-object p0

    return-object p0
.end method

.method public static final hashingSource(Lnicoid/network238/okio/Source;Ljavax/crypto/Mac;)Lnicoid/network238/okio/HashingSource;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__JvmOkioKt;->hashingSource(Lnicoid/network238/okio/Source;Ljavax/crypto/Mac;)Lnicoid/network238/okio/HashingSource;

    move-result-object p0

    return-object p0
.end method

.method public static final inMemorySocketPair(J)[Lnicoid/network238/okio/Socket;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__JvmOkioKt;->inMemorySocketPair(J)[Lnicoid/network238/okio/Socket;

    move-result-object p0

    return-object p0
.end method

.method public static final limit(Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/Source;
    .registers 3

    .line 1
    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/Okio__OkioKt;->limit(Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/Source;

    move-result-object p0

    return-object p0
.end method

.method public static final limit(Lnicoid/network238/okio/Source;JZ)Lnicoid/network238/okio/Source;
    .registers 4

    .line 1
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/okio/Okio__OkioKt;->limit(Lnicoid/network238/okio/Source;JZ)Lnicoid/network238/okio/Source;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic limit$default(Lnicoid/network238/okio/Source;JZILjava/lang/Object;)Lnicoid/network238/okio/Source;
    .registers 6

    .line 1
    invoke-static/range {p0 .. p5}, Lnicoid/network238/okio/Okio__OkioKt;->limit$default(Lnicoid/network238/okio/Source;JZILjava/lang/Object;)Lnicoid/network238/okio/Source;

    move-result-object p0

    return-object p0
.end method

.method public static final openZip(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileSystem;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__ZlibOkioKt;->openZip(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileSystem;

    move-result-object p0

    return-object p0
.end method

.method public static final sink(Ljava/io/File;)Lnicoid/network238/okio/Sink;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__JvmOkioKt;->sink(Ljava/io/File;)Lnicoid/network238/okio/Sink;

    move-result-object p0

    return-object p0
.end method

.method public static final sink(Ljava/io/File;Z)Lnicoid/network238/okio/Sink;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__JvmOkioKt;->sink(Ljava/io/File;Z)Lnicoid/network238/okio/Sink;

    move-result-object p0

    return-object p0
.end method

.method public static final sink(Ljava/io/OutputStream;)Lnicoid/network238/okio/Sink;
    .registers 1

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__JvmOkioKt;->sink(Ljava/io/OutputStream;)Lnicoid/network238/okio/Sink;

    move-result-object p0

    return-object p0
.end method

.method public static final sink(Ljava/net/Socket;)Lnicoid/network238/okio/Sink;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__JvmOkioKt;->sink(Ljava/net/Socket;)Lnicoid/network238/okio/Sink;

    move-result-object p0

    return-object p0
.end method

.method public static final varargs sink(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Lnicoid/network238/okio/Sink;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__JvmOkioKt;->sink(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Lnicoid/network238/okio/Sink;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic sink$default(Ljava/io/File;ZILjava/lang/Object;)Lnicoid/network238/okio/Sink;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/okio/Okio__JvmOkioKt;->sink$default(Ljava/io/File;ZILjava/lang/Object;)Lnicoid/network238/okio/Sink;

    move-result-object p0

    return-object p0
.end method

.method public static final socket(Ljava/net/Socket;)Lnicoid/network238/okio/Socket;
    .registers 1

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__JvmOkioKt;->socket(Ljava/net/Socket;)Lnicoid/network238/okio/Socket;

    move-result-object p0

    return-object p0
.end method

.method public static final source(Ljava/io/File;)Lnicoid/network238/okio/Source;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__JvmOkioKt;->source(Ljava/io/File;)Lnicoid/network238/okio/Source;

    move-result-object p0

    return-object p0
.end method

.method public static final source(Ljava/io/InputStream;)Lnicoid/network238/okio/Source;
    .registers 1

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__JvmOkioKt;->source(Ljava/io/InputStream;)Lnicoid/network238/okio/Source;

    move-result-object p0

    return-object p0
.end method

.method public static final source(Ljava/net/Socket;)Lnicoid/network238/okio/Source;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/Okio__JvmOkioKt;->source(Ljava/net/Socket;)Lnicoid/network238/okio/Source;

    move-result-object p0

    return-object p0
.end method

.method public static final varargs source(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Lnicoid/network238/okio/Source;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__JvmOkioKt;->source(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Lnicoid/network238/okio/Source;

    move-result-object p0

    return-object p0
.end method

.method public static final use(Ljava/io/Closeable;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Closeable;",
            "R:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")TR;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/Okio__OkioKt;->use(Ljava/io/Closeable;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
