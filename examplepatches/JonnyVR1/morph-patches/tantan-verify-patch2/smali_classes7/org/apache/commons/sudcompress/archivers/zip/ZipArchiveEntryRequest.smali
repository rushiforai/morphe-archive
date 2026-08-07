.class public Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final method:I

.field private final payloadSupplier:Ll/brg0;

.field private final zipArchiveEntry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;


# direct methods
.method private constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ll/brg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;->zipArchiveEntry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 5
    .line 6
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;->method:I

    .line 11
    .line 12
    return-void
.end method

.method public static createZipArchiveEntryRequest(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ll/brg0;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;
    .locals 1

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ll/brg0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public getMethod()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;->method:I

    .line 2
    .line 3
    return p0
.end method

.method public getPayloadStream()Ljava/io/InputStream;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public getZipArchiveEntry()Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;->zipArchiveEntry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 2
    .line 3
    return-object p0
.end method
