.class Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$StoredStatisticsStream;
.super Ll/ezg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StoredStatisticsStream"
.end annotation


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ezg0;-><init>(Ljava/io/InputStream;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getCompressedCount()J
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ezg0;->getBytesRead()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public getUncompressedCount()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$StoredStatisticsStream;->getCompressedCount()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method
