.class final synthetic Lnicoid/network238/okio/Okio__OkioKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0000\u001a\n\u0010\u0000\u001a\u00020\u0001*\u00020\u0002\u001a\n\u0010\u0000\u001a\u00020\u0003*\u00020\u0004\u001a\r\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0002\u0008\u0006\u001aN\u0010\u0007\u001a\u0002H\u0008\"\u0010\u0008\u0000\u0010\t*\n\u0018\u00010\nj\u0004\u0018\u0001`\u000b\"\u0004\u0008\u0001\u0010\u0008*\u0002H\t2\u0012\u0010\u000c\u001a\u000e\u0012\u0004\u0012\u0002H\t\u0012\u0004\u0012\u0002H\u00080\rH\u0086\u0008\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0001 \u0001\u00a2\u0006\u0002\u0010\u000e\u001a\u001e\u0010\u000f\u001a\u00020\u0002*\u00020\u00022\u0006\u0010\u0010\u001a\u00020\u00112\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u0013H\u0007\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u0014"
    }
    d2 = {
        "buffer",
        "Lnicoid/network238/okio/BufferedSource;",
        "Lnicoid/network238/okio/Source;",
        "Lnicoid/network238/okio/BufferedSink;",
        "Lnicoid/network238/okio/Sink;",
        "blackholeSink",
        "blackhole",
        "use",
        "R",
        "T",
        "Ljava/io/Closeable;",
        "Lnicoid/network238/okio/Closeable;",
        "block",
        "Lnicoid/network238/kotlin/Function1;",
        "(Ljava/io/Closeable;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;",
        "limit",
        "byteCount",
        "",
        "throwIfSourceIsLonger",
        "",
        "okio"
    }
    k = 0x5
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
    xs = "nicoid/network238/okio/Okio"
.end annotation


# direct methods
.method public static final blackhole()Lnicoid/network238/okio/Sink;
    .registers 1

    .line 44
    new-instance v0, Lnicoid/network238/okio/BlackholeSink;

    invoke-direct {v0}, Lnicoid/network238/okio/BlackholeSink;-><init>()V

    return-object v0
.end method

.method public static final buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    new-instance v0, Lnicoid/network238/okio/RealBufferedSink;

    invoke-direct {v0, p0}, Lnicoid/network238/okio/RealBufferedSink;-><init>(Lnicoid/network238/okio/Sink;)V

    return-object v0
.end method

.method public static final buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    new-instance v0, Lnicoid/network238/okio/RealBufferedSource;

    invoke-direct {v0, p0}, Lnicoid/network238/okio/RealBufferedSource;-><init>(Lnicoid/network238/okio/Source;)V

    return-object v0
.end method

.method public static final limit(Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/Source;
    .registers 9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-wide v1, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/Okio;->limit$default(Lnicoid/network238/okio/Source;JZILjava/lang/Object;)Lnicoid/network238/okio/Source;

    move-result-object p0

    return-object p0
.end method

.method public static final limit(Lnicoid/network238/okio/Source;JZ)Lnicoid/network238/okio/Source;
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 97
    new-instance v0, Lnicoid/network238/okio/LimitSource;

    invoke-direct {v0, p0, p1, p2, p3}, Lnicoid/network238/okio/LimitSource;-><init>(Lnicoid/network238/okio/Source;JZ)V

    return-object v0
.end method

.method public static synthetic limit$default(Lnicoid/network238/okio/Source;JZILjava/lang/Object;)Lnicoid/network238/okio/Source;
    .registers 6

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    const/4 p3, 0x0

    .line 94
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/okio/Okio;->limit(Lnicoid/network238/okio/Source;JZ)Lnicoid/network238/okio/Source;

    move-result-object p0

    return-object p0
.end method

.method public static final use(Ljava/io/Closeable;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 6
    .param p0, "$this$use"    # Ljava/io/Closeable;
    .param p1, "block"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
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

    .line 73
    const-string v0, "block"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 59
    .local v0, "$i$f$use":I
    const/4 v1, 0x0

    .line 61
    .local v1, "thrown":Ljava/lang/Throwable;
    nop

    .line 62
    :try_start_0
    invoke-interface {p1, p0}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 67
    nop

    .line 68
    if-eqz p0, :cond_0

    :try_start_1
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 69
    :catchall_0
    move-exception v3

    .line 70
    .local v3, "t":Ljava/lang/Throwable;
    nop

    .line 71
    move-object v1, v3

    .end local v3    # "t":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    nop

    .line 76
    goto :goto_2

    .line 63
    :catchall_1
    move-exception v2

    .line 64
    .local v2, "t":Ljava/lang/Throwable;
    move-object v1, v2

    .line 65
    nop

    .line 67
    .end local v2    # "t":Ljava/lang/Throwable;
    nop

    .line 68
    if-eqz p0, :cond_1

    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_1

    .line 69
    :catchall_2
    move-exception v2

    .line 70
    .restart local v2    # "t":Ljava/lang/Throwable;
    nop

    .line 73
    invoke-static {v1, v2}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_1
    :goto_1
    nop

    .line 76
    const/4 v2, 0x0

    .line 61
    :goto_2
    nop

    .line 78
    .local v2, "result":Ljava/lang/Object;
    if-nez v1, :cond_2

    .line 80
    return-object v2

    .line 78
    :cond_2
    throw v1
.end method
