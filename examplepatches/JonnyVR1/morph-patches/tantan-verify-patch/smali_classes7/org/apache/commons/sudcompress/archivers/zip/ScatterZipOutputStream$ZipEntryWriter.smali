.class public Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ZipEntryWriter"
.end annotation


# instance fields
.field private final itemsIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final itemsIteratorData:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->b(Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;)Ll/sng0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/qjg0;

    .line 9
    .line 10
    iget-boolean v1, v0, Ll/qjg0;->c:Z

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object v1, v0, Ll/qjg0;->b:Ljava/io/OutputStream;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    iput-boolean v1, v0, Ll/qjg0;->c:Z

    .line 21
    .line 22
    :cond_0
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->d(Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;)Ljava/util/Queue;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;->itemsIterator:Ljava/util/Iterator;

    .line 31
    .line 32
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->b(Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;)Ll/sng0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Ll/qjg0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/qjg0;->k()Ljava/io/InputStream;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;->itemsIteratorData:Ljava/io/InputStream;

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;->itemsIteratorData:Ljava/io/InputStream;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public writeNextZipEntry(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;->itemsIterator:Ljava/util/Iterator;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;

    .line 8
    .line 9
    new-instance v1, Ll/ung0;

    .line 10
    .line 11
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;->itemsIteratorData:Ljava/io/InputStream;

    .line 12
    .line 13
    iget-wide v2, v0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->compressedSize:J

    .line 14
    .line 15
    invoke-direct {v1, p0, v2, v3}, Ll/ung0;-><init>(Ljava/io/InputStream;J)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->transferToArchiveEntry()Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->addRawArchiveEntry(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ljava/io/InputStream;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
