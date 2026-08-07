.class final Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CurrentEntry"
.end annotation


# instance fields
.field private bytesRead:J

.field private bytesReadFromStream:J

.field private final crc:Ljava/util/zip/CRC32;

.field private final entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

.field private hasDataDescriptor:Z

.field private in:Ljava/io/InputStream;

.field private usesZip64:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 10
    .line 11
    new-instance v0, Ljava/util/zip/CRC32;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->crc:Ljava/util/zip/CRC32;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ll/mpq0;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesRead:J

    return-wide v0
.end method

.method public static bridge synthetic b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J

    return-wide v0
.end method

.method public static bridge synthetic c(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Ljava/util/zip/CRC32;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->crc:Ljava/util/zip/CRC32;

    return-object p0
.end method

.method public static bridge synthetic d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    return-object p0
.end method

.method public static bridge synthetic e(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->hasDataDescriptor:Z

    return p0
.end method

.method public static bridge synthetic f(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Ljava/io/InputStream;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->in:Ljava/io/InputStream;

    return-object p0
.end method

.method public static bridge synthetic g(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->usesZip64:Z

    return p0
.end method

.method public static bridge synthetic h(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesRead:J

    return-void
.end method

.method public static bridge synthetic i(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J

    return-void
.end method

.method public static bridge synthetic j(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->hasDataDescriptor:Z

    return-void
.end method

.method public static bridge synthetic k(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Ljava/io/InputStream;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->in:Ljava/io/InputStream;

    return-void
.end method

.method public static bridge synthetic l(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->usesZip64:Z

    return-void
.end method
