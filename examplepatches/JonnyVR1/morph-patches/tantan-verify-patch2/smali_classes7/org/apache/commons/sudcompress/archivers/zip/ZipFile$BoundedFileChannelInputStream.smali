.class Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedFileChannelInputStream;
.super Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BoundedFileChannelInputStream"
.end annotation


# instance fields
.field private final archive:Ljava/nio/channels/FileChannel;

.field final synthetic this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;


# direct methods
.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;JJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedFileChannelInputStream;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;JJ)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;)Ljava/nio/channels/SeekableByteChannel;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ljava/nio/channels/FileChannel;

    .line 11
    .line 12
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedFileChannelInputStream;->archive:Ljava/nio/channels/FileChannel;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public read(JLjava/nio/ByteBuffer;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedFileChannelInputStream;->archive:Ljava/nio/channels/FileChannel;

    .line 2
    .line 3
    invoke-virtual {p0, p3, p1, p2}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 8
    .line 9
    .line 10
    return p0
.end method
