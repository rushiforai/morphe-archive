.class final Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CurrentEntry"
.end annotation


# instance fields
.field private bytesRead:J

.field private causedUseOfZip64:Z

.field private dataStart:J

.field private final entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

.field private hasWritten:Z

.field private localDataStart:J


# direct methods
.method private constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->localDataStart:J

    .line 7
    .line 8
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->dataStart:J

    .line 9
    .line 10
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->bytesRead:J

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->causedUseOfZip64:Z

    .line 14
    .line 15
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 16
    .line 17
    return-void
.end method

.method public synthetic constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ll/spq0;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    return-void
.end method

.method public static bridge synthetic a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->bytesRead:J

    return-wide v0
.end method

.method public static bridge synthetic b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->causedUseOfZip64:Z

    return p0
.end method

.method public static bridge synthetic c(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->dataStart:J

    return-wide v0
.end method

.method public static bridge synthetic d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    return-object p0
.end method

.method public static bridge synthetic e(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->hasWritten:Z

    return p0
.end method

.method public static bridge synthetic f(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->localDataStart:J

    return-wide v0
.end method

.method public static bridge synthetic g(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->bytesRead:J

    return-void
.end method

.method public static bridge synthetic h(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->causedUseOfZip64:Z

    return-void
.end method

.method public static bridge synthetic i(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->dataStart:J

    return-void
.end method

.method public static bridge synthetic j(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->hasWritten:Z

    return-void
.end method

.method public static bridge synthetic k(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->localDataStart:J

    return-void
.end method
