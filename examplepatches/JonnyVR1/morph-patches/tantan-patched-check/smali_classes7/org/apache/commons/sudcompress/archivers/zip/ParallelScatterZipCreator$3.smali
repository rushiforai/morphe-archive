.class Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->createCallable(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ll/brg0;)Ljava/util/concurrent/Callable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;

.field final synthetic val$zipArchiveEntryRequest:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;


# direct methods
.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$3;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$3;->val$zipArchiveEntryRequest:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 19
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$3;->call()Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    move-result-object p0

    return-object p0
.end method

.method public call()Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$3;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->c(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;)Ljava/lang/ThreadLocal;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    .line 12
    .line 13
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$3;->val$zipArchiveEntryRequest:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->addArchiveEntry(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
