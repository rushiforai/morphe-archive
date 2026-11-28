.class final Lcom/google/common/io/TempFileCreator$TempFileAndChannel;
.super Ljava/lang/Object;
.source "TempFileCreator.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/TempFileCreator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TempFileAndChannel"
.end annotation


# instance fields
.field final channel:Ljava/nio/channels/FileChannel;

.field final file:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;Ljava/nio/channels/FileChannel;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "channel"
        }
    .end annotation

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->file:Ljava/io/File;

    .line 73
    iput-object p2, p0, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->channel:Ljava/nio/channels/FileChannel;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    new-instance v0, Lcom/google/common/io/TempFileCreator$TempFileAndChannel$0;

    invoke-direct {v0, p0}, Lcom/google/common/io/TempFileCreator$TempFileAndChannel$0;-><init>(Lcom/google/common/io/TempFileCreator$TempFileAndChannel;)V

    .line 88
    :try_start_0
    iget-object p0, p0, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {p0}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    return-void

    :catchall_0
    move-exception p0

    .line 82
    :try_start_1
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0
.end method

.method synthetic lambda$close$0$com-google-common-io-TempFileCreator$TempFileAndChannel()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 85
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not delete: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->file:Ljava/io/File;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
