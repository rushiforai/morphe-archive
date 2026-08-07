.class final Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor$DataOutputCompressor;
.super Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DataOutputCompressor"
.end annotation


# instance fields
.field private final raf:Ljava/io/DataOutput;


# direct methods
.method public constructor <init>(Ljava/util/zip/Deflater;Ljava/io/DataOutput;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;-><init>(Ljava/util/zip/Deflater;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor$DataOutputCompressor;->raf:Ljava/io/DataOutput;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final writeOut([BII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor$DataOutputCompressor;->raf:Ljava/io/DataOutput;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ljava/io/DataOutput;->write([BII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
