.class public Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$Entry;,
        Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;,
        Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$StoredStatisticsStream;,
        Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;,
        Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedFileChannelInputStream;
    }
.end annotation


# static fields
.field static final BYTE_SHIFT:I = 0x8

.field private static final CFD_DISK_OFFSET:I = 0x6

.field private static final CFD_LOCATOR_OFFSET:I = 0x10

.field private static final CFD_LOCATOR_RELATIVE_OFFSET:I = 0x8

.field private static final CFH_LEN:I = 0x2a

.field private static final CFH_SIG:J

.field private static final HASH_SIZE:I = 0x1fd

.field private static final LFH_OFFSET_FOR_FILENAME_LENGTH:J = 0x1aL

.field private static final MAX_EOCD_SIZE:I = 0x10015

.field static final MIN_EOCD_SIZE:I = 0x16

.field static final NIBLET_MASK:I = 0xf

.field private static final ONE_ZERO_BYTE:[B

.field private static final POS_0:I = 0x0

.field private static final POS_1:I = 0x1

.field private static final POS_2:I = 0x2

.field private static final POS_3:I = 0x3

.field private static final ZIP64_EOCDL_LENGTH:I = 0x14

.field private static final ZIP64_EOCDL_LOCATOR_OFFSET:I = 0x8

.field private static final ZIP64_EOCD_CFD_DISK_OFFSET:I = 0x14

.field private static final ZIP64_EOCD_CFD_LOCATOR_OFFSET:I = 0x30

.field private static final ZIP64_EOCD_CFD_LOCATOR_RELATIVE_OFFSET:I = 0x18


# instance fields
.field private final archive:Ljava/nio/channels/SeekableByteChannel;

.field private final archiveName:Ljava/lang/String;

.field private final cfhBbuf:Ljava/nio/ByteBuffer;

.field private final cfhBuf:[B

.field private volatile closed:Z

.field private final dwordBbuf:Ljava/nio/ByteBuffer;

.field private final dwordBuf:[B

.field private final encoding:Ljava/lang/String;

.field private final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final isSplitZipArchive:Z

.field private final nameMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/LinkedList<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            ">;>;"
        }
    .end annotation
.end field

.field private final offsetComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final shortBbuf:Ljava/nio/ByteBuffer;

.field private final shortBuf:[B

.field private final useUnicodeExtraFields:Z

.field private final wordBbuf:Ljava/nio/ByteBuffer;

.field private final wordBuf:[B

.field private final zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->ONE_ZERO_BYTE:[B

    .line 5
    .line 6
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->CFH_SIG:[B

    .line 7
    .line 8
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([B)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    sput-wide v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->CFH_SIG:J

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1

    .line 134
    const-string v0, "UTF8"

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 125
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 126
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;ZZ)V
    .locals 10

    .line 127
    invoke-static {p1}, Ll/cig0;->a(Ljava/io/File;)Ljava/nio/file/Path;

    move-result-object v0

    invoke-static {}, Ll/ppq0;->a()Ljava/nio/file/StandardOpenOption;

    move-result-object v1

    invoke-static {v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/nio/file/attribute/FileAttribute;

    invoke-static {v0, v1, v2}, Ll/rpq0;->a(Ljava/nio/file/Path;Ljava/util/Set;[Ljava/nio/file/attribute/FileAttribute;)Ljava/nio/channels/SeekableByteChannel;

    move-result-object v4

    .line 128
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x1

    move-object v3, p0

    move-object v6, p2

    move v7, p3

    move v9, p4

    .line 129
    invoke-direct/range {v3 .. v9}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;-><init>(Ljava/nio/channels/SeekableByteChannel;Ljava/lang/String;Ljava/lang/String;ZZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 123
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string p1, "UTF8"

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 124
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-direct {p0, v0, p2, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/SeekableByteChannel;)V
    .locals 3

    .line 130
    const-string v0, "UTF8"

    const/4 v1, 0x1

    const-string v2, "unknown archive"

    invoke-direct {p0, p1, v2, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;-><init>(Ljava/nio/channels/SeekableByteChannel;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/SeekableByteChannel;Ljava/lang/String;)V
    .locals 2

    .line 131
    const-string v0, "unknown archive"

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, p2, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;-><init>(Ljava/nio/channels/SeekableByteChannel;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/SeekableByteChannel;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 132
    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;-><init>(Ljava/nio/channels/SeekableByteChannel;Ljava/lang/String;Ljava/lang/String;ZZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/SeekableByteChannel;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 7

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v6, p5

    .line 133
    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;-><init>(Ljava/nio/channels/SeekableByteChannel;Ljava/lang/String;Ljava/lang/String;ZZZ)V

    return-void
.end method

.method private constructor <init>(Ljava/nio/channels/SeekableByteChannel;Ljava/lang/String;Ljava/lang/String;ZZZ)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    const/16 v1, 0x1fd

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->closed:Z

    .line 22
    .line 23
    const/16 v1, 0x8

    .line 24
    .line 25
    new-array v1, v1, [B

    .line 26
    .line 27
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBuf:[B

    .line 28
    .line 29
    const/4 v2, 0x4

    .line 30
    new-array v2, v2, [B

    .line 31
    .line 32
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBuf:[B

    .line 33
    .line 34
    const/16 v3, 0x2a

    .line 35
    .line 36
    new-array v3, v3, [B

    .line 37
    .line 38
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 39
    .line 40
    const/4 v4, 0x2

    .line 41
    new-array v4, v4, [B

    .line 42
    .line 43
    iput-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->shortBuf:[B

    .line 44
    .line 45
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBbuf:Ljava/nio/ByteBuffer;

    .line 50
    .line 51
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBbuf:Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->shortBbuf:Ljava/nio/ByteBuffer;

    .line 68
    .line 69
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$2;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$2;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;)V

    .line 72
    .line 73
    .line 74
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->offsetComparator:Ljava/util/Comparator;

    .line 75
    .line 76
    instance-of v1, p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitReadOnlySeekableByteChannel;

    .line 77
    .line 78
    iput-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->isSplitZipArchive:Z

    .line 79
    .line 80
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archiveName:Ljava/lang/String;

    .line 81
    .line 82
    iput-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->encoding:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 89
    .line 90
    iput-boolean p4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->useUnicodeExtraFields:Z

    .line 91
    .line 92
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 93
    .line 94
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->populateFromCentralDirectory()Ljava/util/Map;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    if-nez p6, :cond_0

    .line 99
    .line 100
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->resolveLocalFileHeaderData(Ljava/util/Map;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :catchall_0
    move-exception p1

    .line 105
    goto :goto_1

    .line 106
    :cond_0
    :goto_0
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->fillNameMap()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    .line 108
    .line 109
    const/4 p1, 0x0

    .line 110
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->closed:Z

    .line 111
    .line 112
    return-void

    .line 113
    :goto_1
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->closed:Z

    .line 114
    .line 115
    if-eqz p5, :cond_1

    .line 116
    .line 117
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 118
    .line 119
    invoke-static {p0}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 120
    .line 121
    .line 122
    :cond_1
    throw p1
.end method

.method public static bridge synthetic b(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;)Ljava/nio/channels/SeekableByteChannel;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    return-object p0
.end method

.method public static closeQuietly(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private createBoundedInputStream(JJ)Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;
    .locals 8

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 2
    .line 3
    instance-of v0, v0, Ljava/nio/channels/FileChannel;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedFileChannelInputStream;

    .line 8
    .line 9
    move-object v2, p0

    .line 10
    move-wide v3, p1

    .line 11
    move-wide v5, p3

    .line 12
    invoke-direct/range {v1 .. v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedFileChannelInputStream;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;JJ)V

    .line 13
    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    move-object v2, p0

    .line 17
    move-wide v3, p1

    .line 18
    move-wide v5, p3

    .line 19
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;

    .line 20
    .line 21
    move-wide v6, v5

    .line 22
    move-wide v4, v3

    .line 23
    move-object v3, v2

    .line 24
    move-object v2, p0

    .line 25
    invoke-direct/range {v2 .. v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;JJ)V

    .line 26
    .line 27
    .line 28
    return-object v2
.end method

.method private fillNameMap()V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 18
    .line 19
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ljava/util/LinkedList;

    .line 30
    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    new-instance v3, Ljava/util/LinkedList;

    .line 34
    .line 35
    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    .line 39
    .line 40
    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-virtual {v3, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    return-void
.end method

.method private getDataOffset(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)J
    .locals 4

    .line 1
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDataOffset()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    cmp-long v2, v0, v2

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->setDataOffset(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)[I

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDataOffset()J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    return-wide p0

    .line 19
    :cond_0
    return-wide v0
.end method

.method private populateFromCentralDirectory()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->positionAtCentralDirectory()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 15
    .line 16
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBuf:[B

    .line 22
    .line 23
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([B)J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    sget-wide v3, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->CFH_SIG:J

    .line 28
    .line 29
    cmp-long v3, v1, v3

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->startsWithLocalFileHeader()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string p0, "Central directory is empty, can\'t expand corrupt archive."

    .line 41
    .line 42
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return-object p0

    .line 47
    :cond_1
    :goto_0
    sget-wide v3, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->CFH_SIG:J

    .line 48
    .line 49
    cmp-long v1, v1, v3

    .line 50
    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->readCentralDirectoryEntry(Ljava/util/Map;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 62
    .line 63
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    invoke-static {v1, v2}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBuf:[B

    .line 69
    .line 70
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([B)J

    .line 71
    .line 72
    .line 73
    move-result-wide v1

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    return-object v0
.end method

.method private positionAtCentralDirectory()V
    .locals 6

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->positionAtEndOfCentralDirectoryRecord()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/nio/channels/SeekableByteChannel;->position()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const-wide/16 v2, 0x14

    .line 11
    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v1

    .line 20
    :goto_0
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/nio/channels/SeekableByteChannel;->position()J

    .line 25
    .line 26
    .line 27
    move-result-wide v4

    .line 28
    sub-long/2addr v4, v2

    .line 29
    invoke-interface {v1, v4, v5}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 38
    .line 39
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 42
    .line 43
    .line 44
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_LOC_SIG:[B

    .line 45
    .line 46
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBuf:[B

    .line 47
    .line 48
    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    :cond_1
    if-nez v1, :cond_3

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    const/16 v0, 0x10

    .line 57
    .line 58
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 59
    .line 60
    .line 61
    :cond_2
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->positionAtCentralDirectory32()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->positionAtCentralDirectory64()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private positionAtCentralDirectory32()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->isSplitZipArchive:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x6

    .line 6
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->shortBbuf:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 15
    .line 16
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->shortBbuf:Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->shortBuf:[B

    .line 22
    .line 23
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([B)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/16 v1, 0x8

    .line 28
    .line 29
    invoke-direct {p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 38
    .line 39
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBuf:[B

    .line 45
    .line 46
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([B)J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 51
    .line 52
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitReadOnlySeekableByteChannel;

    .line 53
    .line 54
    int-to-long v3, v0

    .line 55
    invoke-virtual {p0, v3, v4, v1, v2}, Ll/xfg0;->position(JJ)Ljava/nio/channels/SeekableByteChannel;

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    const/16 v0, 0x10

    .line 60
    .line 61
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 70
    .line 71
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 77
    .line 78
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBuf:[B

    .line 79
    .line 80
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([B)J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    invoke-interface {v0, v1, v2}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method private positionAtCentralDirectory64()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->isSplitZipArchive:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 11
    .line 12
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBuf:[B

    .line 18
    .line 19
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([B)J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBbuf:Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 29
    .line 30
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBbuf:Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    invoke-static {v2, v3}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBuf:[B

    .line 36
    .line 37
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue([B)J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 42
    .line 43
    check-cast v4, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitReadOnlySeekableByteChannel;

    .line 44
    .line 45
    invoke-virtual {v4, v0, v1, v2, v3}, Ll/xfg0;->position(JJ)Ljava/nio/channels/SeekableByteChannel;

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v0, 0x4

    .line 50
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBbuf:Ljava/nio/ByteBuffer;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 59
    .line 60
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBbuf:Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 66
    .line 67
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBuf:[B

    .line 68
    .line 69
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue([B)J

    .line 70
    .line 71
    .line 72
    move-result-wide v1

    .line 73
    invoke-interface {v0, v1, v2}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 74
    .line 75
    .line 76
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 82
    .line 83
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    invoke-static {v0, v1}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBuf:[B

    .line 89
    .line 90
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_SIG:[B

    .line 91
    .line 92
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->isSplitZipArchive:Z

    .line 99
    .line 100
    if-eqz v0, :cond_1

    .line 101
    .line 102
    const/16 v0, 0x10

    .line 103
    .line 104
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 113
    .line 114
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    invoke-static {v0, v1}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBuf:[B

    .line 120
    .line 121
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([B)J

    .line 122
    .line 123
    .line 124
    move-result-wide v0

    .line 125
    const/16 v2, 0x18

    .line 126
    .line 127
    invoke-direct {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 128
    .line 129
    .line 130
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBbuf:Ljava/nio/ByteBuffer;

    .line 131
    .line 132
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 133
    .line 134
    .line 135
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 136
    .line 137
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBbuf:Ljava/nio/ByteBuffer;

    .line 138
    .line 139
    invoke-static {v2, v3}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 140
    .line 141
    .line 142
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBuf:[B

    .line 143
    .line 144
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue([B)J

    .line 145
    .line 146
    .line 147
    move-result-wide v2

    .line 148
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 149
    .line 150
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitReadOnlySeekableByteChannel;

    .line 151
    .line 152
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/xfg0;->position(JJ)Ljava/nio/channels/SeekableByteChannel;

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_1
    const/16 v0, 0x2c

    .line 157
    .line 158
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBbuf:Ljava/nio/ByteBuffer;

    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 167
    .line 168
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBbuf:Ljava/nio/ByteBuffer;

    .line 169
    .line 170
    invoke-static {v0, v1}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 174
    .line 175
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->dwordBuf:[B

    .line 176
    .line 177
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue([B)J

    .line 178
    .line 179
    .line 180
    move-result-wide v1

    .line 181
    invoke-interface {v0, v1, v2}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :cond_2
    new-instance p0, Ljava/util/zip/ZipException;

    .line 186
    .line 187
    const-string v0, "Archive\'s ZIP64 end of central directory locator is corrupt."

    .line 188
    .line 189
    invoke-direct {p0, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    throw p0
.end method

.method private positionAtEndOfCentralDirectoryRecord()V
    .locals 6

    .line 1
    sget-object v5, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    .line 2
    .line 3
    const-wide/16 v1, 0x16

    .line 4
    .line 5
    const-wide/32 v3, 0x10015

    .line 6
    .line 7
    .line 8
    move-object v0, p0

    .line 9
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->tryToLocateSignature(JJ[B)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance p0, Ljava/util/zip/ZipException;

    .line 17
    .line 18
    const-string v0, "Archive is not a ZIP archive"

    .line 19
    .line 20
    invoke-direct {p0, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p0
.end method

.method private readCentralDirectoryEntry(Ljava/util/Map;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBbuf:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 7
    .line 8
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBbuf:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$Entry;

    .line 14
    .line 15
    invoke-direct {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$Entry;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-static {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setVersionMadeBy(I)V

    .line 26
    .line 27
    .line 28
    const/16 v2, 0x8

    .line 29
    .line 30
    shr-int/2addr v1, v2

    .line 31
    and-int/lit8 v1, v1, 0xf

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setPlatform(I)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 37
    .line 38
    const/4 v3, 0x2

    .line 39
    invoke-static {v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setVersionRequired(I)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 47
    .line 48
    const/4 v3, 0x4

    .line 49
    invoke-static {v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->parse([BI)Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->usesUTF8ForNames()Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-eqz v4, :cond_0

    .line 58
    .line 59
    sget-object v5, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 63
    .line 64
    :goto_0
    if-eqz v4, :cond_1

    .line 65
    .line 66
    sget-object v6, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;->NAME_WITH_EFS_FLAG:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;

    .line 67
    .line 68
    invoke-virtual {v0, v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setNameSource(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setGeneralPurposeBit(Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 75
    .line 76
    invoke-static {v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setRawFlag(I)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 84
    .line 85
    const/4 v3, 0x6

    .line 86
    invoke-static {v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setMethod(I)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 94
    .line 95
    invoke-static {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 96
    .line 97
    .line 98
    move-result-wide v1

    .line 99
    invoke-static {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->dosToJavaTime(J)J

    .line 100
    .line 101
    .line 102
    move-result-wide v1

    .line 103
    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 107
    .line 108
    const/16 v2, 0xc

    .line 109
    .line 110
    invoke-static {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 111
    .line 112
    .line 113
    move-result-wide v1

    .line 114
    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 118
    .line 119
    const/16 v2, 0x10

    .line 120
    .line 121
    invoke-static {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 122
    .line 123
    .line 124
    move-result-wide v1

    .line 125
    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 129
    .line 130
    const/16 v2, 0x14

    .line 131
    .line 132
    invoke-static {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 133
    .line 134
    .line 135
    move-result-wide v1

    .line 136
    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 137
    .line 138
    .line 139
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 140
    .line 141
    const/16 v2, 0x18

    .line 142
    .line 143
    invoke-static {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 148
    .line 149
    const/16 v3, 0x1a

    .line 150
    .line 151
    invoke-static {v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 156
    .line 157
    const/16 v6, 0x1c

    .line 158
    .line 159
    invoke-static {v3, v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 164
    .line 165
    const/16 v7, 0x1e

    .line 166
    .line 167
    invoke-static {v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 168
    .line 169
    .line 170
    move-result v6

    .line 171
    int-to-long v6, v6

    .line 172
    invoke-virtual {v0, v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setDiskNumberStart(J)V

    .line 173
    .line 174
    .line 175
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 176
    .line 177
    const/16 v7, 0x20

    .line 178
    .line 179
    invoke-static {v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 180
    .line 181
    .line 182
    move-result v6

    .line 183
    invoke-virtual {v0, v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setInternalAttributes(I)V

    .line 184
    .line 185
    .line 186
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 187
    .line 188
    const/16 v7, 0x22

    .line 189
    .line 190
    invoke-static {v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 191
    .line 192
    .line 193
    move-result-wide v6

    .line 194
    invoke-virtual {v0, v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExternalAttributes(J)V

    .line 195
    .line 196
    .line 197
    new-array v1, v1, [B

    .line 198
    .line 199
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 200
    .line 201
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 202
    .line 203
    .line 204
    move-result-object v7

    .line 205
    invoke-static {v6, v7}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 206
    .line 207
    .line 208
    invoke-interface {v5, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v6

    .line 212
    invoke-virtual {v0, v6, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;[B)V

    .line 213
    .line 214
    .line 215
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->cfhBuf:[B

    .line 216
    .line 217
    const/16 v7, 0x26

    .line 218
    .line 219
    invoke-static {v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 220
    .line 221
    .line 222
    move-result-wide v6

    .line 223
    invoke-virtual {v0, v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setLocalHeaderOffset(J)V

    .line 224
    .line 225
    .line 226
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    .line 227
    .line 228
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    new-array v2, v2, [B

    .line 232
    .line 233
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 234
    .line 235
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 236
    .line 237
    .line 238
    move-result-object v7

    .line 239
    invoke-static {v6, v7}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setCentralDirectoryExtra([B)V

    .line 243
    .line 244
    .line 245
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->setSizesAndOffsetFromZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 246
    .line 247
    .line 248
    new-array v2, v3, [B

    .line 249
    .line 250
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 251
    .line 252
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 253
    .line 254
    .line 255
    move-result-object v6

    .line 256
    invoke-static {v3, v6}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 257
    .line 258
    .line 259
    invoke-interface {v5, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    invoke-virtual {v0, v3}, Ljava/util/zip/ZipEntry;->setComment(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    if-nez v4, :cond_2

    .line 267
    .line 268
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->useUnicodeExtraFields:Z

    .line 269
    .line 270
    if-eqz p0, :cond_2

    .line 271
    .line 272
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;

    .line 273
    .line 274
    const/4 v3, 0x0

    .line 275
    invoke-direct {p0, v1, v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;-><init>([B[BLl/tpq0;)V

    .line 276
    .line 277
    .line 278
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    :cond_2
    const/4 p0, 0x1

    .line 282
    invoke-virtual {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setStreamContiguous(Z)V

    .line 283
    .line 284
    .line 285
    return-void
.end method

.method private resolveLocalFileHeaderData(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 18
    .line 19
    check-cast v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$Entry;

    .line 20
    .line 21
    invoke-direct {p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->setDataOffset(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)[I

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const/4 v3, 0x0

    .line 26
    aget v3, v2, v3

    .line 27
    .line 28
    const/4 v4, 0x1

    .line 29
    aget v2, v2, v4

    .line 30
    .line 31
    invoke-direct {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 32
    .line 33
    .line 34
    new-array v2, v2, [B

    .line 35
    .line 36
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 37
    .line 38
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-static {v3, v4}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra([B)V

    .line 46
    .line 47
    .line 48
    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_0

    .line 53
    .line 54
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;

    .line 59
    .line 60
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;)[B

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;)[B

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-static {v1, v3, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->setNameAndCommentFromExtraFields(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;[B[B)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    return-void
.end method

.method private setDataOffset(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)[I
    .locals 8

    .line 1
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getLocalHeaderOffset()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->isSplitZipArchive:Z

    .line 6
    .line 7
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 8
    .line 9
    const-wide/16 v4, 0x1a

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    check-cast v3, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitReadOnlySeekableByteChannel;

    .line 14
    .line 15
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDiskNumberStart()J

    .line 16
    .line 17
    .line 18
    move-result-wide v6

    .line 19
    add-long/2addr v0, v4

    .line 20
    invoke-virtual {v3, v6, v7, v0, v1}, Ll/xfg0;->position(JJ)Ljava/nio/channels/SeekableByteChannel;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/nio/channels/SeekableByteChannel;->position()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    sub-long/2addr v0, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    add-long/2addr v4, v0

    .line 32
    invoke-interface {v3, v4, v5}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 41
    .line 42
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    invoke-static {v2, v3}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->shortBuf:[B

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->shortBuf:[B

    .line 60
    .line 61
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([B)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->shortBuf:[B

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->shortBuf:[B

    .line 73
    .line 74
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([B)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    const-wide/16 v3, 0x1e

    .line 79
    .line 80
    add-long/2addr v0, v3

    .line 81
    int-to-long v3, v2

    .line 82
    add-long/2addr v0, v3

    .line 83
    int-to-long v3, p0

    .line 84
    add-long/2addr v0, v3

    .line 85
    invoke-virtual {p1, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setDataOffset(J)V

    .line 86
    .line 87
    .line 88
    filled-new-array {v2, p0}, [I

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method private setSizesAndOffsetFromZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V
    .locals 10

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 8
    .line 9
    if-eqz p0, :cond_9

    .line 10
    .line 11
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide v2, 0xffffffffL

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    cmp-long v0, v0, v2

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    const/4 v4, 0x1

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    move v0, v4

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v0, v1

    .line 29
    :goto_0
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 30
    .line 31
    .line 32
    move-result-wide v5

    .line 33
    cmp-long v5, v5, v2

    .line 34
    .line 35
    if-nez v5, :cond_1

    .line 36
    .line 37
    move v5, v4

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move v5, v1

    .line 40
    :goto_1
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getLocalHeaderOffset()J

    .line 41
    .line 42
    .line 43
    move-result-wide v6

    .line 44
    cmp-long v2, v6, v2

    .line 45
    .line 46
    if-nez v2, :cond_2

    .line 47
    .line 48
    move v2, v4

    .line 49
    goto :goto_2

    .line 50
    :cond_2
    move v2, v1

    .line 51
    :goto_2
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDiskNumberStart()J

    .line 52
    .line 53
    .line 54
    move-result-wide v6

    .line 55
    const-wide/32 v8, 0xffff

    .line 56
    .line 57
    .line 58
    cmp-long v3, v6, v8

    .line 59
    .line 60
    if-nez v3, :cond_3

    .line 61
    .line 62
    move v1, v4

    .line 63
    :cond_3
    invoke-virtual {p0, v0, v5, v2, v1}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->reparseCentralDirectoryData(ZZZZ)V

    .line 64
    .line 65
    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->getSize()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    .line 73
    .line 74
    .line 75
    move-result-wide v3

    .line 76
    invoke-virtual {p1, v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 77
    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_4
    if-eqz v5, :cond_5

    .line 81
    .line 82
    new-instance v3, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 83
    .line 84
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 85
    .line 86
    .line 87
    move-result-wide v6

    .line 88
    invoke-direct {v3, v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->setSize(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 92
    .line 93
    .line 94
    :cond_5
    :goto_3
    if-eqz v5, :cond_6

    .line 95
    .line 96
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->getCompressedSize()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    invoke-virtual {p1, v3, v4}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 105
    .line 106
    .line 107
    goto :goto_4

    .line 108
    :cond_6
    if-eqz v0, :cond_7

    .line 109
    .line 110
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 113
    .line 114
    .line 115
    move-result-wide v3

    .line 116
    invoke-direct {v0, v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->setCompressedSize(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    :goto_4
    if-eqz v2, :cond_8

    .line 123
    .line 124
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->getRelativeHeaderOffset()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    .line 129
    .line 130
    .line 131
    move-result-wide v2

    .line 132
    invoke-virtual {p1, v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setLocalHeaderOffset(J)V

    .line 133
    .line 134
    .line 135
    :cond_8
    if-eqz v1, :cond_9

    .line 136
    .line 137
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->getDiskStartNumber()Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue()J

    .line 142
    .line 143
    .line 144
    move-result-wide v0

    .line 145
    invoke-virtual {p1, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setDiskNumberStart(J)V

    .line 146
    .line 147
    .line 148
    :cond_9
    return-void
.end method

.method private skipBytes(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/nio/channels/SeekableByteChannel;->position()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    int-to-long v2, p1

    .line 8
    add-long/2addr v0, v2

    .line 9
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/nio/channels/SeekableByteChannel;->size()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long p1, v0, v2

    .line 16
    .line 17
    if-gtz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 20
    .line 21
    invoke-interface {p0, v0, v1}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private startsWithLocalFileHeader()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-interface {v0, v1, v2}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 14
    .line 15
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBuf:[B

    .line 21
    .line 22
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    .line 23
    .line 24
    invoke-static {p0, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method private tryToLocateSignature(JJ[B)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/nio/channels/SeekableByteChannel;->size()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sub-long/2addr v0, p1

    .line 8
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/nio/channels/SeekableByteChannel;->size()J

    .line 11
    .line 12
    .line 13
    move-result-wide p1

    .line 14
    sub-long/2addr p1, p3

    .line 15
    const-wide/16 p3, 0x0

    .line 16
    .line 17
    invoke-static {p3, p4, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide p1

    .line 21
    cmp-long p3, v0, p3

    .line 22
    .line 23
    const/4 p4, 0x0

    .line 24
    if-ltz p3, :cond_1

    .line 25
    .line 26
    :goto_0
    cmp-long p3, v0, p1

    .line 27
    .line 28
    if-ltz p3, :cond_1

    .line 29
    .line 30
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 31
    .line 32
    invoke-interface {p3, v0, v1}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 33
    .line 34
    .line 35
    :try_start_0
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 38
    .line 39
    .line 40
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 41
    .line 42
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    invoke-static {p3, v2}, Ll/xeg0;->d(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)V

    .line 45
    .line 46
    .line 47
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->get()B

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    aget-byte v2, p5, p4

    .line 59
    .line 60
    if-ne p3, v2, :cond_0

    .line 61
    .line 62
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 63
    .line 64
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->get()B

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    const/4 v2, 0x1

    .line 69
    aget-byte v3, p5, v2

    .line 70
    .line 71
    if-ne p3, v3, :cond_0

    .line 72
    .line 73
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 74
    .line 75
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->get()B

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    const/4 v3, 0x2

    .line 80
    aget-byte v3, p5, v3

    .line 81
    .line 82
    if-ne p3, v3, :cond_0

    .line 83
    .line 84
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->wordBbuf:Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->get()B

    .line 87
    .line 88
    .line 89
    move-result p3

    .line 90
    const/4 v3, 0x3

    .line 91
    aget-byte v3, p5, v3

    .line 92
    .line 93
    if-ne p3, v3, :cond_0

    .line 94
    .line 95
    move p4, v2

    .line 96
    goto :goto_1

    .line 97
    :cond_0
    const-wide/16 v2, 0x1

    .line 98
    .line 99
    sub-long/2addr v0, v2

    .line 100
    goto :goto_0

    .line 101
    :catch_0
    :cond_1
    :goto_1
    if-eqz p4, :cond_2

    .line 102
    .line 103
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 104
    .line 105
    invoke-interface {p0, v0, v1}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 106
    .line 107
    .line 108
    :cond_2
    return p4
.end method


# virtual methods
.method public canReadEntryData(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->canHandleEntryData(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public close()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->closed:Z

    .line 3
    .line 4
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archive:Ljava/nio/channels/SeekableByteChannel;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/nio/channels/Channel;->close()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public copyRawEntries(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryPredicate;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->getEntriesInPhysicalOrder()Ljava/util/Enumeration;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 16
    .line 17
    invoke-interface {p2, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryPredicate;->test(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->getRawInputStream(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/io/InputStream;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->addRawArchiveEntry(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ljava/io/InputStream;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public finalize()V
    .locals 3

    .line 1
    const-string v0, "Cleaning up unclosed ZipFile for archive "

    .line 2
    .line 3
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->closed:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->archiveName:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :goto_1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 37
    .line 38
    .line 39
    throw v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->encoding:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEntries(Ljava/lang/String;)Ljava/lang/Iterable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Iterable<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 13
    .line 14
    return-object p0
.end method

.method public getEntries()Ljava/util/Enumeration;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation

    .line 15
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    invoke-static {p0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object p0

    return-object p0
.end method

.method public getEntriesInPhysicalOrder(Ljava/lang/String;)Ljava/lang/Iterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Iterable<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 3
    .line 4
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/util/LinkedList;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    move-object v0, p1

    .line 25
    check-cast v0, [Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 26
    .line 27
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->offsetComparator:Ljava/util/Comparator;

    .line 28
    .line 29
    invoke-static {v0, p0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public getEntriesInPhysicalOrder()Ljava/util/Enumeration;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 38
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->offsetComparator:Ljava/util/Comparator;

    invoke-static {v0, p0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 39
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object p0

    return-object p0
.end method

.method public getEntry(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/LinkedList;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public getInputStream(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/io/InputStream;
    .locals 5

    .line 1
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$Entry;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->checkRequestedFeatures(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->getDataOffset(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    new-instance v2, Ljava/io/BufferedInputStream;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    invoke-direct {p0, v0, v1, v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->createBoundedInputStream(JJ)Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {v2, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 25
    .line 26
    .line 27
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$3;->$SwitchMap$org$apache$commons$sudcompress$archivers$zip$ZipMethod:[I

    .line 28
    .line 29
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getMethodByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    aget v0, v0, v1

    .line 42
    .line 43
    packed-switch v0, :pswitch_data_0

    .line 44
    .line 45
    .line 46
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;

    .line 47
    .line 48
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getMethodByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-direct {p0, v0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 57
    .line 58
    .line 59
    throw p0

    .line 60
    :pswitch_0
    new-instance p0, Ll/ijg0;

    .line 61
    .line 62
    invoke-direct {p0, v2}, Ll/ijg0;-><init>(Ljava/io/InputStream;)V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :pswitch_1
    new-instance p0, Ll/tqg0;

    .line 67
    .line 68
    invoke-direct {p0, v2}, Ll/tqg0;-><init>(Ljava/io/InputStream;)V

    .line 69
    .line 70
    .line 71
    return-object p0

    .line 72
    :pswitch_2
    new-instance p1, Ljava/util/zip/Inflater;

    .line 73
    .line 74
    const/4 v0, 0x1

    .line 75
    invoke-direct {p1, v0}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$1;

    .line 79
    .line 80
    new-instance v1, Ljava/io/SequenceInputStream;

    .line 81
    .line 82
    new-instance v3, Ljava/io/ByteArrayInputStream;

    .line 83
    .line 84
    sget-object v4, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->ONE_ZERO_BYTE:[B

    .line 85
    .line 86
    invoke-direct {v3, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 87
    .line 88
    .line 89
    invoke-direct {v1, v2, v3}, Ljava/io/SequenceInputStream;-><init>(Ljava/io/InputStream;Ljava/io/InputStream;)V

    .line 90
    .line 91
    .line 92
    invoke-direct {v0, p0, v1, p1, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$1;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;Ljava/io/InputStream;Ljava/util/zip/Inflater;Ljava/util/zip/Inflater;)V

    .line 93
    .line 94
    .line 95
    return-object v0

    .line 96
    :pswitch_3
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;

    .line 97
    .line 98
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->getSlidingDictionarySize()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->getNumberOfShannonFanoTrees()I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    invoke-direct {p0, v0, p1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;-><init>(IILjava/io/InputStream;)V

    .line 115
    .line 116
    .line 117
    return-object p0

    .line 118
    :pswitch_4
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;

    .line 119
    .line 120
    invoke-direct {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;-><init>(Ljava/io/InputStream;)V

    .line 121
    .line 122
    .line 123
    return-object p0

    .line 124
    :pswitch_5
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$StoredStatisticsStream;

    .line 125
    .line 126
    invoke-direct {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$StoredStatisticsStream;-><init>(Ljava/io/InputStream;)V

    .line 127
    .line 128
    .line 129
    return-object p0

    .line 130
    nop

    .line 131
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getRawInputStream(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/io/InputStream;
    .locals 6

    .line 1
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$Entry;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDataOffset()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    const-wide/16 v4, -0x1

    .line 12
    .line 13
    cmp-long v0, v2, v4

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_1
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    invoke-direct {p0, v2, v3, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->createBoundedInputStream(JJ)Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public getUnixSymlink(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/lang/String;
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->isUnixSymlink()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->getInputStream(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/io/InputStream;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :try_start_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 14
    .line 15
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 18
    .line 19
    .line 20
    const/16 v1, 0x1f58

    .line 21
    .line 22
    new-array v1, v1, [B

    .line 23
    .line 24
    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/4 v3, -0x1

    .line 29
    if-eq v3, v2, :cond_0

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :goto_1
    if-eqz p1, :cond_1

    .line 51
    .line 52
    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 53
    .line 54
    .line 55
    goto :goto_2

    .line 56
    :catchall_1
    move-exception p1

    .line 57
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    :goto_2
    throw p0

    .line 61
    :cond_2
    const/4 p0, 0x0

    .line 62
    return-object p0
.end method
