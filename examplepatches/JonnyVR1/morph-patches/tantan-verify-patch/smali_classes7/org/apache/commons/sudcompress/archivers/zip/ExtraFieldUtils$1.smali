.class Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$onUnparseableData:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;


# direct methods
.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$1;->val$onUnparseableData:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public createExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->createExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public fill(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->fillExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onUnparseableExtraField([BIIZI)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$1;->val$onUnparseableData:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->onUnparseableExtraField([BIIZI)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
