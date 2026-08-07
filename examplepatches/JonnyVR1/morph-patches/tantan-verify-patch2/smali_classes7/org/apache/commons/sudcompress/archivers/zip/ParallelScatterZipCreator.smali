.class public Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$DefaultBackingStoreSupplier;
    }
.end annotation


# instance fields
.field private final backingStoreSupplier:Ll/vtg0;

.field private compressionDoneAt:J

.field private final es:Ljava/util/concurrent/ExecutorService;

.field private final futures:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ljava/util/concurrent/Future<",
            "+",
            "Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;",
            ">;>;"
        }
    .end annotation
.end field

.field private scatterDoneAt:J

.field private final startedAt:J

.field private final streams:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;",
            ">;"
        }
    .end annotation
.end field

.field private final tlScatterStreams:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;-><init>(Ljava/util/concurrent/ExecutorService;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 2

    .line 40
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$DefaultBackingStoreSupplier;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$DefaultBackingStoreSupplier;-><init>(Ll/yf60;)V

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;-><init>(Ljava/util/concurrent/ExecutorService;Ll/vtg0;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;Ll/vtg0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->streams:Ljava/util/Deque;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->futures:Ljava/util/Deque;

    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->startedAt:J

    .line 23
    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->compressionDoneAt:J

    .line 27
    .line 28
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$1;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$1;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->tlScatterStreams:Ljava/lang/ThreadLocal;

    .line 34
    .line 35
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->backingStoreSupplier:Ll/vtg0;

    .line 36
    .line 37
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->es:Ljava/util/concurrent/ExecutorService;

    .line 38
    .line 39
    return-void
.end method

.method public static bridge synthetic a(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;)Ll/vtg0;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->backingStoreSupplier:Ll/vtg0;

    return-object p0
.end method

.method public static bridge synthetic b(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;)Ljava/util/Deque;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->streams:Ljava/util/Deque;

    return-object p0
.end method

.method public static bridge synthetic c(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;)Ljava/lang/ThreadLocal;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->tlScatterStreams:Ljava/lang/ThreadLocal;

    return-object p0
.end method

.method private closeAll()V
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->streams:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :catch_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    .line 18
    .line 19
    :try_start_0
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method private createDeferred(Ll/vtg0;)Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;
    .locals 1

    .line 1
    invoke-interface {p1}, Ll/vtg0;->get()Ll/sng0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, -0x1

    .line 6
    invoke-static {p1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->create(ILl/sng0;)Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;-><init>(Ll/sng0;Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static bridge synthetic d(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;Ll/vtg0;)Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->createDeferred(Ll/vtg0;)Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public addArchiveEntry(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ll/brg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->createCallable(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ll/brg0;)Ljava/util/concurrent/Callable;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->submitStreamAwareCallable(Ljava/util/concurrent/Callable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public addArchiveEntry(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequestSupplier;)V
    .locals 0

    .line 9
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->createCallable(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequestSupplier;)Ljava/util/concurrent/Callable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->submitStreamAwareCallable(Ljava/util/concurrent/Callable;)V

    return-void
.end method

.method public final createCallable(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ll/brg0;)Ljava/util/concurrent/Callable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            "Ll/brg0;",
            ")",
            "Ljava/util/concurrent/Callable<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    invoke-static {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;->createZipArchiveEntryRequest(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ll/brg0;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance p2, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$3;

    .line 13
    .line 14
    invoke-direct {p2, p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$3;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;)V

    .line 15
    .line 16
    .line 17
    return-object p2

    .line 18
    :cond_0
    const-string p0, "Method must be set on zipArchiveEntry: "

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public final createCallable(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequestSupplier;)Ljava/util/concurrent/Callable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequestSupplier;",
            ")",
            "Ljava/util/concurrent/Callable<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;",
            ">;"
        }
    .end annotation

    .line 25
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$4;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$4;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequestSupplier;)V

    return-object v0
.end method

.method public getStatisticsMessage()Lorg/apache/commons/sudcompress/archivers/zip/ScatterStatistics;
    .locals 7

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterStatistics;

    .line 2
    .line 3
    iget-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->compressionDoneAt:J

    .line 4
    .line 5
    iget-wide v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->startedAt:J

    .line 6
    .line 7
    sub-long v3, v1, v3

    .line 8
    .line 9
    iget-wide v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->scatterDoneAt:J

    .line 10
    .line 11
    sub-long/2addr v5, v1

    .line 12
    invoke-direct {v0, v3, v4, v5, v6}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterStatistics;-><init>(JJ)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public final submit(Ljava/util/concurrent/Callable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$2;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;Ljava/util/concurrent/Callable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->submitStreamAwareCallable(Ljava/util/concurrent/Callable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final submitStreamAwareCallable(Ljava/util/concurrent/Callable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "+",
            "Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->futures:Ljava/util/Deque;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->es:Ljava/util/concurrent/ExecutorService;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public writeTo(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;)V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->futures:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/util/concurrent/Future;

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    goto :goto_3

    .line 25
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->es:Ljava/util/concurrent/ExecutorService;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->es:Ljava/util/concurrent/ExecutorService;

    .line 31
    .line 32
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 33
    .line 34
    const-wide/32 v2, 0xea60

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v2, v3, v1}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->compressionDoneAt:J

    .line 45
    .line 46
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->futures:Ljava/util/Deque;

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Ljava/util/concurrent/Future;

    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    .line 69
    .line 70
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->zipEntryWriter()Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;->writeNextZipEntry(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :catchall_1
    move-exception p1

    .line 79
    goto :goto_4

    .line 80
    :cond_1
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->streams:Ljava/util/Deque;

    .line 81
    .line 82
    invoke-interface {p1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    .line 97
    .line 98
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->close()V

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 103
    .line 104
    .line 105
    move-result-wide v0

    .line 106
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->scatterDoneAt:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 107
    .line 108
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->closeAll()V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :goto_3
    :try_start_2
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->es:Ljava/util/concurrent/ExecutorService;

    .line 113
    .line 114
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 115
    .line 116
    .line 117
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 118
    :goto_4
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->closeAll()V

    .line 119
    .line 120
    .line 121
    throw p1
.end method
