.class public final Lcom/google/common/io/FileBackedOutputStream;
.super Ljava/io/OutputStream;
.source "FileBackedOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/io/FileBackedOutputStream$State;,
        Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;,
        Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;,
        Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;,
        Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;
    }
.end annotation


# static fields
.field private static final CLOSED_OUTPUT_STREAM:Ljava/io/OutputStream;

.field private static final IS_REACHABILITY_FENCE_METHOD_USABLE:Z


# instance fields
.field private final byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

.field private final state:Lcom/google/common/io/FileBackedOutputStream$State;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 364
    new-instance v0, Lcom/google/common/io/FileBackedOutputStream$1;

    invoke-direct {v0}, Lcom/google/common/io/FileBackedOutputStream$1;-><init>()V

    sput-object v0, Lcom/google/common/io/FileBackedOutputStream;->CLOSED_OUTPUT_STREAM:Ljava/io/OutputStream;

    .line 468
    invoke-static {}, Lcom/google/common/io/FileBackedOutputStream;->computeIsReachabilityFenceMethodUsable()Z

    move-result v0

    sput-boolean v0, Lcom/google/common/io/FileBackedOutputStream;->IS_REACHABILITY_FENCE_METHOD_USABLE:Z

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fileThreshold"
        }
    .end annotation

    const/4 v0, 0x0

    .line 109
    invoke-direct {p0, p1, v0}, Lcom/google/common/io/FileBackedOutputStream;-><init>(IZ)V

    return-void
.end method

.method public constructor <init>(IZ)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fileThreshold",
            "resetWhenGarbageCollected"
        }
    .end annotation

    .line 124
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 125
    :goto_0
    const-string v1, "fileThreshold must be non-negative, but was %s"

    invoke-static {v0, v1, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 127
    new-instance v0, Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-direct {v0, p1, p2}, Lcom/google/common/io/FileBackedOutputStream$State;-><init>(IZ)V

    iput-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    .line 128
    new-instance p1, Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-direct {p1, v0}, Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;-><init>(Lcom/google/common/io/FileBackedOutputStream$State;)V

    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    if-eqz p2, :cond_1

    .line 131
    invoke-static {p1}, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;->register(Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;)V

    :cond_1
    return-void
.end method

.method static synthetic access$100()Ljava/io/OutputStream;
    .registers 1

    .line 80
    sget-object v0, Lcom/google/common/io/FileBackedOutputStream;->CLOSED_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-object v0
.end method

.method private static computeIsReachabilityFenceMethodUsable()Z
    .registers 6

    const/4 v0, 0x0

    .line 472
    :try_start_0
    const-class v1, Ljava/lang/ref/Reference;

    const-string v2, "reachabilityFence"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/Object;

    aput-object v5, v4, v0

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 473
    const-class v2, Lcom/google/common/io/FileBackedOutputStream;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return v3

    :catch_0
    move-exception v0

    .line 489
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Throwables;->throwIfUnchecked(Ljava/lang/Throwable;)V

    .line 490
    new-instance v1, Ljava/lang/AssertionError;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    :catch_1
    return v0
.end method

.method static reachabilityFence(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 462
    sget-boolean v0, Lcom/google/common/io/FileBackedOutputStream;->IS_REACHABILITY_FENCE_METHOD_USABLE:Z

    if-eqz v0, :cond_0

    .line 463
    invoke-static {p0}, Ljava/lang/ref/Reference;->reachabilityFence(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public asByteSource()Lcom/google/common/io/ByteSource;
    .registers 1

    .line 184
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    return-object p0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 227
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {v0}, Lcom/google/common/io/FileBackedOutputStream$State;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 229
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 230
    throw v0
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 236
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {v0}, Lcom/google/common/io/FileBackedOutputStream$State;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 238
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 239
    throw v0
.end method

.method getFile()Ljava/io/File;
    .registers 1

    .line 98
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {p0}, Lcom/google/common/io/FileBackedOutputStream$State;->getFile()Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public reset()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 195
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {v0}, Lcom/google/common/io/FileBackedOutputStream$State;->reset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 198
    throw v0
.end method

.method public write(I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 204
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {v0, p1}, Lcom/google/common/io/FileBackedOutputStream$State;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 207
    throw p1
.end method

.method public write([B)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 212
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/io/FileBackedOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "b",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/common/io/FileBackedOutputStream$State;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 221
    throw p1
.end method
