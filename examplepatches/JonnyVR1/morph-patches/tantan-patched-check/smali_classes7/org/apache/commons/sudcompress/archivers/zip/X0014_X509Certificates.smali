.class public Lorg/apache/commons/sudcompress/archivers/zip/X0014_X509Certificates;
.super Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const/16 v1, 0x14

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
