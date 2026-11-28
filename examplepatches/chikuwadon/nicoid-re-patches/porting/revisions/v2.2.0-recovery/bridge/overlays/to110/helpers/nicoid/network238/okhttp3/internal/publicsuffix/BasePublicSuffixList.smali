.class public abstract Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0004\u0008 \u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0013\u001a\u00020\u0014H\u0002J\u0008\u0010\u0015\u001a\u00020\u0016H&J\u0008\u0010\u0017\u001a\u00020\u0014H\u0016J\u0008\u0010\u001c\u001a\u00020\u0014H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0008\u001a\u00020\tX\u0096.\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\rR\u001a\u0010\u000e\u001a\u00020\tX\u0096.\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000f\u0010\u000b\"\u0004\u0008\u0010\u0010\rR\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0018\u001a\u00020\u0019X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u001a\u0010\u001b\u00a8\u0006\u001d"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;",
        "Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;",
        "<init>",
        "()V",
        "listRead",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "readCompleteLatch",
        "Ljava/util/concurrent/CountDownLatch;",
        "bytes",
        "Lnicoid/network238/okio/ByteString;",
        "getBytes",
        "()Lnicoid/network238/okio/ByteString;",
        "setBytes",
        "(Lnicoid/network238/okio/ByteString;)V",
        "exceptionBytes",
        "getExceptionBytes",
        "setExceptionBytes",
        "readFailure",
        "Ljava/io/IOException;",
        "readTheList",
        "",
        "listSource",
        "Lnicoid/network238/okio/Source;",
        "ensureLoaded",
        "path",
        "",
        "getPath",
        "()Ljava/lang/Object;",
        "readTheListUninterruptibly",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public bytes:Lnicoid/network238/okio/ByteString;

.field public exceptionBytes:Lnicoid/network238/okio/ByteString;

.field private final listRead:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final readCompleteLatch:Ljava/util/concurrent/CountDownLatch;

.field private readFailure:Ljava/io/IOException;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->listRead:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 31
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->readCompleteLatch:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method

.method private final readTheList()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->listSource()Lnicoid/network238/okio/Source;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 49
    :try_start_1
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result v1

    int-to-long v1, v1

    .line 50
    invoke-interface {v0, v1, v2}, Lnicoid/network238/okio/BufferedSource;->readByteString(J)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    .line 52
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result v2

    int-to-long v2, v2

    .line 53
    invoke-interface {v0, v2, v3}, Lnicoid/network238/okio/BufferedSource;->readByteString(J)Lnicoid/network238/okio/ByteString;

    move-result-object v2

    .line 54
    sget-object v3, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 48
    const/4 v3, 0x0

    :try_start_2
    invoke-static {v0, v3}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 56
    monitor-enter p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 57
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->setBytes(Lnicoid/network238/okio/ByteString;)V

    .line 58
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v2}, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->setExceptionBytes(Lnicoid/network238/okio/ByteString;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 56
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 61
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->readCompleteLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void

    :catchall_0
    move-exception v0

    .line 56
    :try_start_5
    monitor-exit p0

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    :catchall_1
    move-exception v1

    .line 48
    :try_start_6
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception v2

    :try_start_7
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    :catchall_3
    move-exception v0

    .line 61
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->readCompleteLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    throw v0
.end method

.method private final readTheListUninterruptibly()V
    .registers 3

    const/4 v0, 0x0

    .line 98
    :goto_0
    :try_start_0
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->readTheList()V
    :try_end_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 104
    :try_start_1
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->readFailure:Ljava/io/IOException;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_0

    .line 110
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_0
    return-void

    :catch_1
    move-exception v1

    .line 101
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    .line 110
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_1
    throw v1
.end method


# virtual methods
.method public ensureLoaded()V
    .registers 4

    .line 68
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->listRead:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->listRead:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->readTheListUninterruptibly()V

    goto :goto_0

    .line 72
    :cond_0
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->readCompleteLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 74
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 78
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->bytes:Lnicoid/network238/okio/ByteString;

    if-eqz v0, :cond_1

    return-void

    .line 80
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to load "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->getPath()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " resource."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 81
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->readFailure:Ljava/io/IOException;

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 80
    throw v0
.end method

.method public getBytes()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 37
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->bytes:Lnicoid/network238/okio/ByteString;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "bytes"

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public getExceptionBytes()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 38
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->exceptionBytes:Lnicoid/network238/okio/ByteString;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "exceptionBytes"

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getPath()Ljava/lang/Object;
.end method

.method public abstract listSource()Lnicoid/network238/okio/Source;
.end method

.method public setBytes(Lnicoid/network238/okio/ByteString;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->bytes:Lnicoid/network238/okio/ByteString;

    return-void
.end method

.method public setExceptionBytes(Lnicoid/network238/okio/ByteString;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;->exceptionBytes:Lnicoid/network238/okio/ByteString;

    return-void
.end method
