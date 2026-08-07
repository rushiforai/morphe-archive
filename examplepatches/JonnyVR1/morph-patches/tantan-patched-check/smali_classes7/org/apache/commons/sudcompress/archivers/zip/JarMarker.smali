.class public final Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;


# static fields
.field private static final DEFAULT:Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;

.field private static final ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

.field private static final NO_BYTES:[B

.field private static final NULL:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const v1, 0xcafe

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 10
    .line 11
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->NULL:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 18
    .line 19
    new-array v0, v1, [B

    .line 20
    .line 21
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->NO_BYTES:[B

    .line 22
    .line 23
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;

    .line 24
    .line 25
    invoke-direct {v0}, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;-><init>()V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->DEFAULT:Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->DEFAULT:Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public getCentralDirectoryData()[B
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->NO_BYTES:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->NULL:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalFileDataData()[B
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->NO_BYTES:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->NULL:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;->parseFromLocalFileData([BII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p0, Ljava/util/zip/ZipException;

    .line 5
    .line 6
    const-string p1, "JarMarker doesn\'t expect any data"

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    throw p0
.end method
