.class final Lcom/google/common/io/FileBackedOutputStream$State;
.super Ljava/lang/Object;
.source "FileBackedOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/FileBackedOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field fileAndChannel:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;

.field final fileThreshold:I

.field memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

.field out:Ljava/io/OutputStream;

.field final resetWhenGarbageCollected:Z


# direct methods
.method constructor <init>(IZ)V
    .registers 3
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

    .line 260
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 261
    iput p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileThreshold:I

    .line 262
    iput-boolean p2, p0, Lcom/google/common/io/FileBackedOutputStream$State;->resetWhenGarbageCollected:Z

    .line 263
    new-instance p1, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;-><init>(Lcom/google/common/io/FileBackedOutputStream$1;)V

    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    .line 264
    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    return-void
.end method


# virtual methods
.method declared-synchronized close()V
    .registers 2

    monitor-enter p0

    .line 317
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileAndChannel:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;

    if-eqz v0, :cond_0

    .line 319
    # getter for: Lcom/google/common/io/FileBackedOutputStream;->CLOSED_OUTPUT_STREAM:Ljava/io/OutputStream;
    invoke-static {}, Lcom/google/common/io/FileBackedOutputStream;->access$100()Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 325
    :cond_0
    monitor-exit p0

    return-void

    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method declared-synchronized flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 328
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 329
    monitor-exit p0

    return-void

    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method declared-synchronized getFile()Ljava/io/File;
    .registers 2

    monitor-enter p0

    .line 268
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileAndChannel:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->file:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return-object v0

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method declared-synchronized openInputStream()Ljava/io/InputStream;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 272
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileAndChannel:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;

    if-eqz v0, :cond_0

    .line 273
    new-instance v0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;

    iget-object v1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileAndChannel:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;

    iget-object v1, v1, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->channel:Ljava/nio/channels/FileChannel;

    invoke-direct {v0, v1}, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;-><init>(Ljava/nio/channels/FileChannel;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 276
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-virtual {v1}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->getBuffer()[B

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-virtual {v2}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->getCount()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Ljava/io/ByteArrayInputStream;-><init>([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method declared-synchronized reset()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 287
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 288
    new-instance v0, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-direct {v0, v1}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;-><init>(Lcom/google/common/io/FileBackedOutputStream$1;)V

    iput-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    goto :goto_0

    .line 290
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->reset()V

    .line 292
    :goto_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    iput-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    .line 294
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileAndChannel:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 295
    :try_start_1
    iput-object v1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileAndChannel:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    .line 296
    :try_start_2
    invoke-virtual {v0}, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 297
    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    .line 294
    :try_start_3
    invoke-virtual {v0}, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw v1

    :goto_2
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_2
.end method

.method update(I)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 337
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->getCount()I

    move-result v0

    add-int/2addr v0, p1

    iget p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileThreshold:I

    if-le v0, p1, :cond_1

    .line 338
    sget-object p1, Lcom/google/common/io/TempFileCreator;->INSTANCE:Lcom/google/common/io/TempFileCreator;

    const-string v0, "FileBackedOutputStream"

    invoke-virtual {p1, v0}, Lcom/google/common/io/TempFileCreator;->openTempFile(Ljava/lang/String;)Lcom/google/common/io/TempFileCreator$TempFileAndChannel;

    move-result-object p1

    .line 339
    iget-boolean v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->resetWhenGarbageCollected:Z

    if-eqz v0, :cond_0

    .line 341
    iget-object v0, p1, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->deleteOnExit()V

    .line 344
    :cond_0
    :try_start_0
    iget-object v0, p1, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->channel:Ljava/nio/channels/FileChannel;

    invoke-static {v0}, Ljava/nio/channels/Channels;->newOutputStream(Ljava/nio/channels/WritableByteChannel;)Ljava/io/OutputStream;

    move-result-object v0

    .line 345
    iget-object v1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-virtual {v1}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->getBuffer()[B

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-virtual {v2}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->getCount()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 346
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 348
    iput-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 358
    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileAndChannel:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;

    const/4 p1, 0x0

    .line 359
    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    return-void

    :catch_0
    move-exception p0

    .line 351
    :try_start_1
    invoke-virtual {p1}, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 353
    invoke-virtual {p0, p1}, Ljava/io/IOException;->addSuppressed(Ljava/lang/Throwable;)V

    .line 355
    :goto_0
    throw p0

    :cond_1
    return-void
.end method

.method declared-synchronized write(I)V
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

    monitor-enter p0

    const/4 v0, 0x1

    .line 300
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/google/common/io/FileBackedOutputStream$State;->update(I)V

    .line 301
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 302
    monitor-exit p0

    return-void

    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method declared-synchronized write([BII)V
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

    monitor-enter p0

    .line 305
    :try_start_0
    invoke-virtual {p0, p3}, Lcom/google/common/io/FileBackedOutputStream$State;->update(I)V

    .line 306
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 307
    monitor-exit p0

    return-void

    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method
