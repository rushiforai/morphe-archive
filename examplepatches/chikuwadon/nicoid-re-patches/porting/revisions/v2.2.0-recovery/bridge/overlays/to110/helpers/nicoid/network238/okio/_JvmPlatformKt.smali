.class public final Lnicoid/network238/okio/_JvmPlatformKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000T\n\u0000\n\u0002\u0010\u000e\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u000c\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0000\u001a\u000c\u0010\u0003\u001a\u00020\u0002*\u00020\u0001H\u0000\u001a\u000c\u0010\u0008\u001a\u00060\u0007j\u0002`\tH\u0000\u001a:\u0010\n\u001a\u0002H\u000b\"\u0004\u0008\u0000\u0010\u000b*\u00060\u0007j\u0002`\t2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u0002H\u000b0\rH\u0086\u0008\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0001 \u0001\u00a2\u0006\u0002\u0010\u000e*\n\u0010\u0004\"\u00020\u00052\u00020\u0005*\n\u0010\u0006\"\u00020\u00072\u00020\u0007*\n\u0010\u000f\"\u00020\u00102\u00020\u0010*\n\u0010\u0011\"\u00020\u00122\u00020\u0012*\n\u0010\u0013\"\u00020\u00142\u00020\u0014*\n\u0010\u0015\"\u00020\u00162\u00020\u0016*\n\u0010\u0017\"\u00020\u00182\u00020\u0018*\n\u0010\u0019\"\u00020\u001a2\u00020\u001a*\n\u0010\u001b\"\u00020\u001c2\u00020\u001c\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u001d"
    }
    d2 = {
        "toUtf8String",
        "",
        "",
        "asUtf8ToByteArray",
        "ArrayIndexOutOfBoundsException",
        "Ljava/lang/ArrayIndexOutOfBoundsException;",
        "Lock",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "newLock",
        "Lnicoid/network238/okio/Lock;",
        "withLock",
        "T",
        "action",
        "Lnicoid/network238/kotlin/Function0;",
        "(Ljava/util/concurrent/locks/ReentrantLock;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "IOException",
        "Ljava/io/IOException;",
        "ProtocolException",
        "Ljava/net/ProtocolException;",
        "EOFException",
        "Ljava/io/EOFException;",
        "FileNotFoundException",
        "Ljava/io/FileNotFoundException;",
        "Closeable",
        "Ljava/io/Closeable;",
        "Deflater",
        "Ljava/util/zip/Deflater;",
        "Inflater",
        "Ljava/util/zip/Inflater;",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final asUtf8ToByteArray(Ljava/lang/String;)[B
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    sget-object v0, Lnicoid/network238/kotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static final newLock()Ljava/util/concurrent/locks/ReentrantLock;
    .registers 1

    .line 33
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    return-object v0
.end method

.method public static final toUtf8String([B)Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/lang/String;

    .line 24
    sget-object v1, Lnicoid/network238/kotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method

.method public static final withLock(Ljava/util/concurrent/locks/ReentrantLock;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .registers 5
    .param p0, "$this$withLock"    # Ljava/util/concurrent/locks/ReentrantLock;
    .param p1, "action"    # Lnicoid/network238/kotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/locks/ReentrantLock;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TT;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "action"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 40
    .local v0, "$i$f$withLock":I
    move-object v1, p0

    check-cast v1, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    invoke-interface {p1}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v2

    :catchall_0
    move-exception v2

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2
.end method
