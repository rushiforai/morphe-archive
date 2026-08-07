.class final Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor$ScatterGatherBackingStoreCompressor;
.super Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ScatterGatherBackingStoreCompressor"
.end annotation


# instance fields
.field private final bs:Ll/sng0;


# direct methods
.method public constructor <init>(Ljava/util/zip/Deflater;Ll/sng0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;-><init>(Ljava/util/zip/Deflater;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor$ScatterGatherBackingStoreCompressor;->bs:Ll/sng0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final writeOut([BII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor$ScatterGatherBackingStoreCompressor;->bs:Ll/sng0;

    .line 2
    .line 3
    check-cast p0, Ll/qjg0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/qjg0;->b:Ljava/io/OutputStream;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
