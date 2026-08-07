.class final Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "EntryMetaData"
.end annotation


# instance fields
.field private final offset:J

.field private final usesDataDescriptor:Z


# direct methods
.method private constructor <init>(JZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;->offset:J

    .line 5
    .line 6
    iput-boolean p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;->usesDataDescriptor:Z

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(JZLl/spq0;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;-><init>(JZ)V

    return-void
.end method

.method public static bridge synthetic a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;->offset:J

    return-wide v0
.end method

.method public static bridge synthetic b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;->usesDataDescriptor:Z

    return p0
.end method
