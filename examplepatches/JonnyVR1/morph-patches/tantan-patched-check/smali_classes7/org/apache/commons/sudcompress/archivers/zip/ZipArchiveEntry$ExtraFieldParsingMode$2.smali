.class final enum Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode$2;
.super Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;-><init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;Ll/lpq0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;Ll/lpq0;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode$2;-><init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)V

    return-void
.end method


# virtual methods
.method public fill(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
