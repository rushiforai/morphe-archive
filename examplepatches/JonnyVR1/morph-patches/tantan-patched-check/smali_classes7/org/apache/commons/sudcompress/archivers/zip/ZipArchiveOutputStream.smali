.class public Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;
.super Lorg/apache/commons/sudcompress/archivers/Suddo;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;,
        Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;,
        Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;
    }
.end annotation


# static fields
.field static final BUFFER_SIZE:I = 0x200

.field private static final CFH_COMMENT_LENGTH_OFFSET:I = 0x20

.field private static final CFH_COMPRESSED_SIZE_OFFSET:I = 0x14

.field private static final CFH_CRC_OFFSET:I = 0x10

.field private static final CFH_DISK_NUMBER_OFFSET:I = 0x22

.field private static final CFH_EXTERNAL_ATTRIBUTES_OFFSET:I = 0x26

.field private static final CFH_EXTRA_LENGTH_OFFSET:I = 0x1e

.field private static final CFH_FILENAME_LENGTH_OFFSET:I = 0x1c

.field private static final CFH_FILENAME_OFFSET:I = 0x2e

.field private static final CFH_GPB_OFFSET:I = 0x8

.field private static final CFH_INTERNAL_ATTRIBUTES_OFFSET:I = 0x24

.field private static final CFH_LFH_OFFSET:I = 0x2a

.field private static final CFH_METHOD_OFFSET:I = 0xa

.field private static final CFH_ORIGINAL_SIZE_OFFSET:I = 0x18

.field static final CFH_SIG:[B

.field private static final CFH_SIG_OFFSET:I = 0x0

.field private static final CFH_TIME_OFFSET:I = 0xc

.field private static final CFH_VERSION_MADE_BY_OFFSET:I = 0x4

.field private static final CFH_VERSION_NEEDED_OFFSET:I = 0x6

.field static final DD_SIG:[B

.field public static final DEFAULT_COMPRESSION:I = -0x1

.field static final DEFAULT_ENCODING:Ljava/lang/String; = "UTF8"

.field public static final DEFLATED:I = 0x8

.field public static final EFS_FLAG:I = 0x800
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final EMPTY:[B

.field static final EOCD_SIG:[B

.field private static final LFH_COMPRESSED_SIZE_OFFSET:I = 0x12

.field private static final LFH_CRC_OFFSET:I = 0xe

.field private static final LFH_EXTRA_LENGTH_OFFSET:I = 0x1c

.field private static final LFH_FILENAME_LENGTH_OFFSET:I = 0x1a

.field private static final LFH_FILENAME_OFFSET:I = 0x1e

.field private static final LFH_GPB_OFFSET:I = 0x6

.field private static final LFH_METHOD_OFFSET:I = 0x8

.field private static final LFH_ORIGINAL_SIZE_OFFSET:I = 0x16

.field static final LFH_SIG:[B

.field private static final LFH_SIG_OFFSET:I = 0x0

.field private static final LFH_TIME_OFFSET:I = 0xa

.field private static final LFH_VERSION_NEEDED_OFFSET:I = 0x4

.field private static final LZERO:[B

.field private static final ONE:[B

.field public static final STORED:I

.field private static final ZERO:[B

.field static final ZIP64_EOCD_LOC_SIG:[B

.field static final ZIP64_EOCD_SIG:[B


# instance fields
.field private final calendarInstance:Ljava/util/Calendar;

.field private cdDiskNumberStart:J

.field private cdLength:J

.field private cdOffset:J

.field private final channel:Ljava/nio/channels/SeekableByteChannel;

.field private comment:Ljava/lang/String;

.field private final copyBuffer:[B

.field private createUnicodeExtraFields:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

.field protected final def:Ljava/util/zip/Deflater;

.field private encoding:Ljava/lang/String;

.field private final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation
.end field

.field private entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

.field private eocdLength:J

.field private fallbackToUTF8:Z

.field protected finished:Z

.field private hasCompressionLevelChanged:Z

.field private hasUsedZip64:Z

.field private final isSplitZip:Z

.field private level:I

.field private final metaData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private method:I

.field private final numberOfCDInDiskData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final out:Ljava/io/OutputStream;

.field private final streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

.field private useUTF8Flag:Z

.field private zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

.field private zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->EMPTY:[B

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    fill-array-data v0, :array_0

    .line 10
    .line 11
    .line 12
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->ZERO:[B

    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    new-array v0, v0, [B

    .line 16
    .line 17
    fill-array-data v0, :array_1

    .line 18
    .line 19
    .line 20
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->LZERO:[B

    .line 21
    .line 22
    const-wide/16 v0, 0x1

    .line 23
    .line 24
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->ONE:[B

    .line 29
    .line 30
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 31
    .line 32
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    .line 37
    .line 38
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 39
    .line 40
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->DD_SIG:[B

    .line 45
    .line 46
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 47
    .line 48
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->CFH_SIG:[B

    .line 53
    .line 54
    const-wide/32 v0, 0x6054b50

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    .line 62
    .line 63
    const-wide/32 v0, 0x6064b50

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_SIG:[B

    .line 71
    .line 72
    const-wide/32 v0, 0x7064b50

    .line 73
    .line 74
    .line 75
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_LOC_SIG:[B

    .line 80
    .line 81
    return-void

    .line 82
    nop

    .line 83
    :array_0
    .array-data 1
        0x0t
        0x0t
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    nop

    .line 89
    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/Suddo;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    iput v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 13
    .line 14
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    .line 15
    .line 16
    const/16 v1, 0x8

    .line 17
    .line 18
    iput v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->method:I

    .line 19
    .line 20
    new-instance v1, Ljava/util/LinkedList;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 26
    .line 27
    const-wide/16 v1, 0x0

    .line 28
    .line 29
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 30
    .line 31
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 32
    .line 33
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdDiskNumberStart:J

    .line 34
    .line 35
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->eocdLength:J

    .line 36
    .line 37
    new-instance v1, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->metaData:Ljava/util/Map;

    .line 43
    .line 44
    const-string v1, "UTF8"

    .line 45
    .line 46
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    iput-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 56
    .line 57
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 58
    .line 59
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 60
    .line 61
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 62
    .line 63
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 64
    .line 65
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->AsNeeded:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 66
    .line 67
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 68
    .line 69
    const v2, 0x8000

    .line 70
    .line 71
    .line 72
    new-array v2, v2, [B

    .line 73
    .line 74
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->copyBuffer:[B

    .line 75
    .line 76
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->calendarInstance:Ljava/util/Calendar;

    .line 81
    .line 82
    new-instance v2, Ljava/util/HashMap;

    .line 83
    .line 84
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 88
    .line 89
    new-instance v2, Ljava/util/zip/Deflater;

    .line 90
    .line 91
    iget v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 92
    .line 93
    invoke-direct {v2, v3, v1}, Ljava/util/zip/Deflater;-><init>(IZ)V

    .line 94
    .line 95
    .line 96
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    .line 97
    .line 98
    const/4 v1, 0x0

    .line 99
    :try_start_0
    invoke-static {p1}, Ll/cig0;->a(Ljava/io/File;)Ljava/nio/file/Path;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-static {}, Ll/npq0;->a()Ljava/nio/file/StandardOpenOption;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-static {}, Ll/opq0;->a()Ljava/nio/file/StandardOpenOption;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-static {}, Ll/ppq0;->a()Ljava/nio/file/StandardOpenOption;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    invoke-static {}, Ll/qpq0;->a()Ljava/nio/file/StandardOpenOption;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    invoke-static {v4, v5, v6, v7}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    new-array v5, v0, [Ljava/nio/file/attribute/FileAttribute;

    .line 124
    .line 125
    invoke-static {v3, v4, v5}, Ll/rpq0;->a(Ljava/nio/file/Path;Ljava/util/Set;[Ljava/nio/file/attribute/FileAttribute;)Ljava/nio/channels/SeekableByteChannel;

    .line 126
    .line 127
    .line 128
    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    :try_start_1
    invoke-static {v3, v2}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->create(Ljava/nio/channels/SeekableByteChannel;Ljava/util/zip/Deflater;)Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 130
    .line 131
    .line 132
    move-result-object p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 133
    goto :goto_0

    .line 134
    :catch_0
    move-object v3, v1

    .line 135
    :catch_1
    invoke-static {v3}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 136
    .line 137
    .line 138
    new-instance v2, Ljava/io/FileOutputStream;

    .line 139
    .line 140
    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    .line 144
    .line 145
    invoke-static {v2, p1}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->create(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    move-object v3, v1

    .line 150
    move-object v1, v2

    .line 151
    :goto_0
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 152
    .line 153
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 154
    .line 155
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 156
    .line 157
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 158
    .line 159
    return-void
.end method

.method public constructor <init>(Ljava/io/File;J)V
    .locals 3

    .line 187
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/Suddo;-><init>()V

    const/4 v0, 0x0

    .line 188
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 189
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    const/4 v1, -0x1

    .line 190
    iput v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 191
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    const/16 v1, 0x8

    .line 192
    iput v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->method:I

    .line 193
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    const-wide/16 v1, 0x0

    .line 194
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 195
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 196
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdDiskNumberStart:J

    .line 197
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->eocdLength:J

    .line 198
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->metaData:Ljava/util/Map;

    .line 199
    const-string v1, "UTF8"

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 200
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    const/4 v1, 0x1

    .line 201
    iput-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 202
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 203
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 204
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 205
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->AsNeeded:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    const v0, 0x8000

    .line 206
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->copyBuffer:[B

    .line 207
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->calendarInstance:Ljava/util/Calendar;

    .line 208
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 209
    new-instance v0, Ljava/util/zip/Deflater;

    iget v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    invoke-direct {v0, v2, v1}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    .line 210
    new-instance v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    invoke-direct {v2, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;-><init>(Ljava/io/File;J)V

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 211
    invoke-static {v2, v0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->create(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    const/4 p1, 0x0

    .line 212
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 213
    iput-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 4

    .line 160
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/Suddo;-><init>()V

    const/4 v0, 0x0

    .line 161
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 162
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    const/4 v1, -0x1

    .line 163
    iput v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 164
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    const/16 v1, 0x8

    .line 165
    iput v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->method:I

    .line 166
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    const-wide/16 v1, 0x0

    .line 167
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 168
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 169
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdDiskNumberStart:J

    .line 170
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->eocdLength:J

    .line 171
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->metaData:Ljava/util/Map;

    .line 172
    const-string v1, "UTF8"

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 173
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    const/4 v1, 0x1

    .line 174
    iput-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 175
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 176
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 177
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 178
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->AsNeeded:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    const v2, 0x8000

    .line 179
    new-array v2, v2, [B

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->copyBuffer:[B

    .line 180
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->calendarInstance:Ljava/util/Calendar;

    .line 181
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 182
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    const/4 v2, 0x0

    .line 183
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 184
    new-instance v2, Ljava/util/zip/Deflater;

    iget v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    invoke-direct {v2, v3, v1}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    .line 185
    invoke-static {p1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->create(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 186
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/SeekableByteChannel;)V
    .locals 4

    .line 214
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/Suddo;-><init>()V

    const/4 v0, 0x0

    .line 215
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 216
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    const/4 v1, -0x1

    .line 217
    iput v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 218
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    const/16 v1, 0x8

    .line 219
    iput v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->method:I

    .line 220
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    const-wide/16 v1, 0x0

    .line 221
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 222
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 223
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdDiskNumberStart:J

    .line 224
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->eocdLength:J

    .line 225
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->metaData:Ljava/util/Map;

    .line 226
    const-string v1, "UTF8"

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 227
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    const/4 v1, 0x1

    .line 228
    iput-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 229
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 230
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 231
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 232
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->AsNeeded:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    const v2, 0x8000

    .line 233
    new-array v2, v2, [B

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->copyBuffer:[B

    .line 234
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->calendarInstance:Ljava/util/Calendar;

    .line 235
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 236
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 237
    new-instance v2, Ljava/util/zip/Deflater;

    iget v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    invoke-direct {v2, v3, v1}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    .line 238
    invoke-static {p1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->create(Ljava/nio/channels/SeekableByteChannel;Ljava/util/zip/Deflater;)Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    const/4 p1, 0x0

    .line 239
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 240
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    return-void
.end method

.method private addUnicodeExtraFields(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;ZLjava/nio/ByteBuffer;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 2
    .line 3
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->ALWAYS:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    if-nez p2, :cond_1

    .line 8
    .line 9
    :cond_0
    new-instance p2, Lorg/apache/commons/sudcompress/archivers/zip/UnicodePathExtraField;

    .line 10
    .line 11
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->array()[B

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p3}, Ljava/nio/Buffer;->limit()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {p3}, Ljava/nio/Buffer;->position()I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    sub-int/2addr v4, p3

    .line 32
    invoke-direct {p2, v0, v2, v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/UnicodePathExtraField;-><init>(Ljava/lang/String;[BII)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->addExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getComment()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    if-eqz p2, :cond_3

    .line 43
    .line 44
    const-string p3, ""

    .line 45
    .line 46
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    if-nez p3, :cond_3

    .line 51
    .line 52
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 53
    .line 54
    invoke-interface {p3, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 59
    .line 60
    if-eq v0, v1, :cond_2

    .line 61
    .line 62
    if-nez p3, :cond_3

    .line 63
    .line 64
    :cond_2
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getEntryEncoding(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p0, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    new-instance p3, Lorg/apache/commons/sudcompress/archivers/zip/UnicodeCommentExtraField;

    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    sub-int/2addr v2, p0

    .line 91
    invoke-direct {p3, p2, v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/UnicodeCommentExtraField;-><init>(Ljava/lang/String;[BII)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->addExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V

    .line 95
    .line 96
    .line 97
    :cond_3
    return-void
.end method

.method private checkIfNeedsZip64(Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isZip64Required(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 14
    .line 15
    if-eq p1, v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;

    .line 19
    .line 20
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 21
    .line 22
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;->getEntryTooBigMessage(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-direct {p1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p1

    .line 34
    :cond_1
    :goto_0
    return v0
.end method

.method private closeCopiedEntry(Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->preClose()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 5
    .line 6
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-static {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->g(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 18
    .line 19
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getEffectiveZip64Mode(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->checkIfNeedsZip64(Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-direct {p0, v0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->closeEntry(ZZ)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private closeEntry(ZZ)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->rewriteSizesAndCrc(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-nez p2, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 13
    .line 14
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeDataDescriptor(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 23
    .line 24
    return-void
.end method

.method private copyFromZipInputStream(Ljava/io/InputStream;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->checkRequestedFeatures(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->j(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;Z)V

    .line 16
    .line 17
    .line 18
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->copyBuffer:[B

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-ltz v0, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 27
    .line 28
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->copyBuffer:[B

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {v1, v2, v3, v0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->writeCounted([BII)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/Suddo;->count(I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    const-string p0, "No current entry"

    .line 40
    .line 41
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private createCentralFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)[B
    .locals 5

    .line 407
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->metaData:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;

    .line 408
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 409
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v1

    const-wide v3, 0xffffffffL

    cmp-long v1, v1, v3

    if-gez v1, :cond_1

    .line 410
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v1

    cmp-long v1, v1, v3

    if-gez v1, :cond_1

    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;)J

    move-result-wide v1

    cmp-long v1, v1, v3

    if-gez v1, :cond_1

    .line 411
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDiskNumberStart()J

    move-result-wide v1

    const-wide/32 v3, 0xffff

    cmp-long v1, v1, v3

    if-gez v1, :cond_1

    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    if-eqz v1, :cond_3

    .line 412
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    sget-object v3, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    if-eq v2, v3, :cond_2

    goto :goto_2

    .line 413
    :cond_2
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;

    const-string p1, "Archive\'s size exceeds the limit of 4GByte."

    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 414
    :cond_3
    :goto_2
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;)J

    move-result-wide v2

    invoke-direct {p0, p1, v2, v3, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->handleZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;JZ)V

    .line 415
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getName(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-direct {p0, p1, v2, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createCentralFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ljava/nio/ByteBuffer;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;Z)[B

    move-result-object p0

    return-object p0
.end method

.method private createCentralFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ljava/nio/ByteBuffer;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;Z)[B
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-object v1, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 9
    .line 10
    check-cast v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 11
    .line 12
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentIndex()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v3, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 17
    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget-object v4, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 27
    .line 28
    if-nez v3, :cond_0

    .line 29
    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    iget-object v4, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 57
    .line 58
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    add-int/2addr v3, v2

    .line 63
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getCentralDirectoryExtra()[B

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual/range {p1 .. p1}, Ljava/util/zip/ZipEntry;->getComment()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    if-nez v3, :cond_2

    .line 79
    .line 80
    const-string v3, ""

    .line 81
    .line 82
    :cond_2
    invoke-direct/range {p0 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getEntryEncoding(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-interface {v4, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual/range {p2 .. p2}, Ljava/nio/Buffer;->limit()I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    invoke-virtual/range {p2 .. p2}, Ljava/nio/Buffer;->position()I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    sub-int/2addr v4, v5

    .line 99
    invoke-virtual {v3}, Ljava/nio/Buffer;->limit()I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    sub-int/2addr v5, v6

    .line 108
    add-int/lit8 v6, v4, 0x2e

    .line 109
    .line 110
    array-length v7, v1

    .line 111
    add-int/2addr v7, v6

    .line 112
    add-int/2addr v7, v5

    .line 113
    new-array v7, v7, [B

    .line 114
    .line 115
    sget-object v8, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->CFH_SIG:[B

    .line 116
    .line 117
    const/4 v9, 0x0

    .line 118
    const/4 v10, 0x4

    .line 119
    invoke-static {v8, v9, v7, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 120
    .line 121
    .line 122
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getPlatform()I

    .line 123
    .line 124
    .line 125
    move-result v8

    .line 126
    const/16 v11, 0x8

    .line 127
    .line 128
    shl-int/2addr v8, v11

    .line 129
    iget-boolean v12, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 130
    .line 131
    const/16 v13, 0x14

    .line 132
    .line 133
    if-nez v12, :cond_3

    .line 134
    .line 135
    move v12, v13

    .line 136
    goto :goto_1

    .line 137
    :cond_3
    const/16 v12, 0x2d

    .line 138
    .line 139
    :goto_1
    or-int/2addr v8, v12

    .line 140
    invoke-static {v8, v7, v10}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 141
    .line 142
    .line 143
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 144
    .line 145
    .line 146
    move-result v8

    .line 147
    iget-object v10, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 148
    .line 149
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v12

    .line 153
    invoke-interface {v10, v12}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    move-result v10

    .line 157
    invoke-static/range {p3 .. p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;)Z

    .line 158
    .line 159
    .line 160
    move-result v12

    .line 161
    move/from16 v14, p4

    .line 162
    .line 163
    invoke-direct {v0, v8, v14, v12}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->versionNeededToExtract(IZZ)I

    .line 164
    .line 165
    .line 166
    move-result v12

    .line 167
    const/4 v14, 0x6

    .line 168
    invoke-static {v12, v7, v14}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 169
    .line 170
    .line 171
    if-nez v10, :cond_4

    .line 172
    .line 173
    iget-boolean v10, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 174
    .line 175
    if-eqz v10, :cond_4

    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_4
    move v2, v9

    .line 179
    :goto_2
    invoke-static/range {p3 .. p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;)Z

    .line 180
    .line 181
    .line 182
    move-result v10

    .line 183
    invoke-direct {v0, v2, v10}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getGeneralPurposeBits(ZZ)Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-virtual {v2, v7, v11}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encode([BI)V

    .line 188
    .line 189
    .line 190
    const/16 v2, 0xa

    .line 191
    .line 192
    invoke-static {v8, v7, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 193
    .line 194
    .line 195
    iget-object v2, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->calendarInstance:Ljava/util/Calendar;

    .line 196
    .line 197
    invoke-virtual/range {p1 .. p1}, Ljava/util/zip/ZipEntry;->getTime()J

    .line 198
    .line 199
    .line 200
    move-result-wide v10

    .line 201
    const/16 v8, 0xc

    .line 202
    .line 203
    invoke-static {v2, v10, v11, v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->toDosTime(Ljava/util/Calendar;J[BI)V

    .line 204
    .line 205
    .line 206
    invoke-virtual/range {p1 .. p1}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 207
    .line 208
    .line 209
    move-result-wide v10

    .line 210
    const/16 v2, 0x10

    .line 211
    .line 212
    invoke-static {v10, v11, v7, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 213
    .line 214
    .line 215
    invoke-virtual/range {p1 .. p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 216
    .line 217
    .line 218
    move-result-wide v10

    .line 219
    const-wide v14, 0xffffffffL

    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    cmp-long v2, v10, v14

    .line 225
    .line 226
    const/16 v8, 0x18

    .line 227
    .line 228
    if-gez v2, :cond_6

    .line 229
    .line 230
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 231
    .line 232
    .line 233
    move-result-wide v10

    .line 234
    cmp-long v2, v10, v14

    .line 235
    .line 236
    if-gez v2, :cond_6

    .line 237
    .line 238
    iget-object v2, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 239
    .line 240
    sget-object v10, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 241
    .line 242
    if-ne v2, v10, :cond_5

    .line 243
    .line 244
    goto :goto_3

    .line 245
    :cond_5
    invoke-virtual/range {p1 .. p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 246
    .line 247
    .line 248
    move-result-wide v10

    .line 249
    invoke-static {v10, v11, v7, v13}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 250
    .line 251
    .line 252
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 253
    .line 254
    .line 255
    move-result-wide v10

    .line 256
    invoke-static {v10, v11, v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 257
    .line 258
    .line 259
    goto :goto_4

    .line 260
    :cond_6
    :goto_3
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 261
    .line 262
    invoke-virtual {v2, v7, v13}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong([BI)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v2, v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong([BI)V

    .line 266
    .line 267
    .line 268
    :goto_4
    const/16 v2, 0x1c

    .line 269
    .line 270
    invoke-static {v4, v7, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 271
    .line 272
    .line 273
    array-length v2, v1

    .line 274
    const/16 v8, 0x1e

    .line 275
    .line 276
    invoke-static {v2, v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 277
    .line 278
    .line 279
    const/16 v2, 0x20

    .line 280
    .line 281
    invoke-static {v5, v7, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 282
    .line 283
    .line 284
    iget-boolean v2, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 285
    .line 286
    const/16 v8, 0x22

    .line 287
    .line 288
    if-eqz v2, :cond_9

    .line 289
    .line 290
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDiskNumberStart()J

    .line 291
    .line 292
    .line 293
    move-result-wide v10

    .line 294
    const-wide/32 v12, 0xffff

    .line 295
    .line 296
    .line 297
    cmp-long v2, v10, v12

    .line 298
    .line 299
    if-gez v2, :cond_8

    .line 300
    .line 301
    iget-object v2, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 302
    .line 303
    sget-object v10, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 304
    .line 305
    if-ne v2, v10, :cond_7

    .line 306
    .line 307
    goto :goto_5

    .line 308
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDiskNumberStart()J

    .line 309
    .line 310
    .line 311
    move-result-wide v10

    .line 312
    long-to-int v2, v10

    .line 313
    invoke-static {v2, v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 314
    .line 315
    .line 316
    goto :goto_6

    .line 317
    :cond_8
    :goto_5
    const v2, 0xffff

    .line 318
    .line 319
    .line 320
    invoke-static {v2, v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 321
    .line 322
    .line 323
    goto :goto_6

    .line 324
    :cond_9
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->ZERO:[B

    .line 325
    .line 326
    const/4 v10, 0x2

    .line 327
    invoke-static {v2, v9, v7, v8, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 328
    .line 329
    .line 330
    :goto_6
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getInternalAttributes()I

    .line 331
    .line 332
    .line 333
    move-result v2

    .line 334
    const/16 v8, 0x24

    .line 335
    .line 336
    invoke-static {v2, v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 337
    .line 338
    .line 339
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    .line 340
    .line 341
    .line 342
    move-result-wide v10

    .line 343
    const/16 v2, 0x26

    .line 344
    .line 345
    invoke-static {v10, v11, v7, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 346
    .line 347
    .line 348
    invoke-static/range {p3 .. p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;)J

    .line 349
    .line 350
    .line 351
    move-result-wide v10

    .line 352
    cmp-long v2, v10, v14

    .line 353
    .line 354
    const/16 v8, 0x2a

    .line 355
    .line 356
    if-gez v2, :cond_b

    .line 357
    .line 358
    iget-object v0, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 359
    .line 360
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 361
    .line 362
    if-ne v0, v2, :cond_a

    .line 363
    .line 364
    goto :goto_7

    .line 365
    :cond_a
    invoke-static {v10, v11, v14, v15}, Ljava/lang/Math;->min(JJ)J

    .line 366
    .line 367
    .line 368
    move-result-wide v10

    .line 369
    invoke-static {v10, v11, v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 370
    .line 371
    .line 372
    goto :goto_8

    .line 373
    :cond_b
    :goto_7
    invoke-static {v14, v15, v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 374
    .line 375
    .line 376
    :goto_8
    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->array()[B

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 381
    .line 382
    .line 383
    move-result v2

    .line 384
    const/16 v8, 0x2e

    .line 385
    .line 386
    invoke-static {v0, v2, v7, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 387
    .line 388
    .line 389
    array-length v0, v1

    .line 390
    invoke-static {v1, v9, v7, v6, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 391
    .line 392
    .line 393
    array-length v0, v1

    .line 394
    add-int/2addr v6, v0

    .line 395
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 400
    .line 401
    .line 402
    move-result v1

    .line 403
    invoke-static {v0, v1, v7, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 404
    .line 405
    .line 406
    return-object v7
.end method

.method private createLocalFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ljava/nio/ByteBuffer;ZZJ)[B
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p4

    .line 6
    .line 7
    sget-object v3, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 8
    .line 9
    invoke-virtual {v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    check-cast v4, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;

    .line 14
    .line 15
    if-eqz v4, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->removeExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getAlignment()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-gtz v3, :cond_1

    .line 25
    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    invoke-virtual {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->getAlignment()S

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    :cond_1
    const/16 v5, 0x1e

    .line 33
    .line 34
    const/4 v6, 0x1

    .line 35
    const/4 v7, 0x0

    .line 36
    if-gt v3, v6, :cond_2

    .line 37
    .line 38
    if-eqz v4, :cond_4

    .line 39
    .line 40
    invoke-virtual {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->allowMethodChange()Z

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    if-nez v8, :cond_4

    .line 45
    .line 46
    :cond_2
    invoke-virtual/range {p2 .. p2}, Ljava/nio/Buffer;->limit()I

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    add-int/2addr v8, v5

    .line 51
    invoke-virtual/range {p2 .. p2}, Ljava/nio/Buffer;->position()I

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    sub-int/2addr v8, v9

    .line 56
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getLocalFileDataExtra()[B

    .line 57
    .line 58
    .line 59
    move-result-object v9

    .line 60
    array-length v9, v9

    .line 61
    add-int/2addr v8, v9

    .line 62
    move-wide/from16 v9, p5

    .line 63
    .line 64
    neg-long v9, v9

    .line 65
    int-to-long v11, v8

    .line 66
    sub-long/2addr v9, v11

    .line 67
    const-wide/16 v11, 0x6

    .line 68
    .line 69
    sub-long/2addr v9, v11

    .line 70
    add-int/lit8 v8, v3, -0x1

    .line 71
    .line 72
    int-to-long v11, v8

    .line 73
    and-long v8, v9, v11

    .line 74
    .line 75
    long-to-int v8, v8

    .line 76
    new-instance v9, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;

    .line 77
    .line 78
    if-eqz v4, :cond_3

    .line 79
    .line 80
    invoke-virtual {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->allowMethodChange()Z

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-eqz v4, :cond_3

    .line 85
    .line 86
    move v4, v6

    .line 87
    goto :goto_0

    .line 88
    :cond_3
    move v4, v7

    .line 89
    :goto_0
    invoke-direct {v9, v3, v4, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;-><init>(IZI)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v9}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->addExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V

    .line 93
    .line 94
    .line 95
    :cond_4
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getLocalFileDataExtra()[B

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual/range {p2 .. p2}, Ljava/nio/Buffer;->limit()I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    invoke-virtual/range {p2 .. p2}, Ljava/nio/Buffer;->position()I

    .line 104
    .line 105
    .line 106
    move-result v8

    .line 107
    sub-int/2addr v4, v8

    .line 108
    add-int/lit8 v8, v4, 0x1e

    .line 109
    .line 110
    array-length v9, v3

    .line 111
    add-int/2addr v9, v8

    .line 112
    new-array v9, v9, [B

    .line 113
    .line 114
    sget-object v10, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    .line 115
    .line 116
    const/4 v11, 0x4

    .line 117
    invoke-static {v10, v7, v9, v7, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 121
    .line 122
    .line 123
    move-result v10

    .line 124
    invoke-direct {v0, v10, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->usesDataDescriptor(IZ)Z

    .line 125
    .line 126
    .line 127
    move-result v12

    .line 128
    invoke-direct/range {p0 .. p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 129
    .line 130
    .line 131
    move-result v13

    .line 132
    invoke-direct {v0, v10, v13, v12}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->versionNeededToExtract(IZZ)I

    .line 133
    .line 134
    .line 135
    move-result v13

    .line 136
    invoke-static {v13, v9, v11}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 137
    .line 138
    .line 139
    if-nez p3, :cond_5

    .line 140
    .line 141
    iget-boolean v13, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 142
    .line 143
    if-eqz v13, :cond_5

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_5
    move v6, v7

    .line 147
    :goto_1
    invoke-direct {v0, v6, v12}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getGeneralPurposeBits(ZZ)Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    const/4 v12, 0x6

    .line 152
    invoke-virtual {v6, v9, v12}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encode([BI)V

    .line 153
    .line 154
    .line 155
    const/16 v6, 0x8

    .line 156
    .line 157
    invoke-static {v10, v9, v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 158
    .line 159
    .line 160
    iget-object v12, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->calendarInstance:Ljava/util/Calendar;

    .line 161
    .line 162
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getTime()J

    .line 163
    .line 164
    .line 165
    move-result-wide v13

    .line 166
    const/16 v15, 0xa

    .line 167
    .line 168
    invoke-static {v12, v13, v14, v9, v15}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->toDosTime(Ljava/util/Calendar;J[BI)V

    .line 169
    .line 170
    .line 171
    const/16 v12, 0xe

    .line 172
    .line 173
    if-eqz v2, :cond_6

    .line 174
    .line 175
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 176
    .line 177
    .line 178
    move-result-wide v13

    .line 179
    invoke-static {v13, v14, v9, v12}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 180
    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_6
    if-eq v10, v6, :cond_8

    .line 184
    .line 185
    iget-object v13, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 186
    .line 187
    if-eqz v13, :cond_7

    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_7
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 191
    .line 192
    .line 193
    move-result-wide v13

    .line 194
    invoke-static {v13, v14, v9, v12}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 195
    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_8
    :goto_2
    sget-object v13, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->LZERO:[B

    .line 199
    .line 200
    invoke-static {v13, v7, v9, v12, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 201
    .line 202
    .line 203
    :goto_3
    iget-object v12, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 204
    .line 205
    invoke-static {v12}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 206
    .line 207
    .line 208
    move-result-object v12

    .line 209
    invoke-direct {v0, v12}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 210
    .line 211
    .line 212
    move-result v12

    .line 213
    const/16 v13, 0x16

    .line 214
    .line 215
    const/16 v14, 0x12

    .line 216
    .line 217
    if-eqz v12, :cond_9

    .line 218
    .line 219
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 220
    .line 221
    invoke-virtual {v0, v9, v14}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong([BI)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0, v9, v13}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong([BI)V

    .line 225
    .line 226
    .line 227
    goto :goto_5

    .line 228
    :cond_9
    if-eqz v2, :cond_a

    .line 229
    .line 230
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 231
    .line 232
    .line 233
    move-result-wide v10

    .line 234
    invoke-static {v10, v11, v9, v14}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 238
    .line 239
    .line 240
    move-result-wide v0

    .line 241
    invoke-static {v0, v1, v9, v13}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 242
    .line 243
    .line 244
    goto :goto_5

    .line 245
    :cond_a
    if-eq v10, v6, :cond_c

    .line 246
    .line 247
    iget-object v0, v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 248
    .line 249
    if-eqz v0, :cond_b

    .line 250
    .line 251
    goto :goto_4

    .line 252
    :cond_b
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 253
    .line 254
    .line 255
    move-result-wide v10

    .line 256
    invoke-static {v10, v11, v9, v14}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 260
    .line 261
    .line 262
    move-result-wide v0

    .line 263
    invoke-static {v0, v1, v9, v13}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 264
    .line 265
    .line 266
    goto :goto_5

    .line 267
    :cond_c
    :goto_4
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->LZERO:[B

    .line 268
    .line 269
    invoke-static {v0, v7, v9, v14, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 270
    .line 271
    .line 272
    invoke-static {v0, v7, v9, v13, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 273
    .line 274
    .line 275
    :goto_5
    const/16 v0, 0x1a

    .line 276
    .line 277
    invoke-static {v4, v9, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 278
    .line 279
    .line 280
    array-length v0, v3

    .line 281
    const/16 v1, 0x1c

    .line 282
    .line 283
    invoke-static {v0, v9, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 284
    .line 285
    .line 286
    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->array()[B

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    invoke-static {v0, v1, v9, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 295
    .line 296
    .line 297
    array-length v0, v3

    .line 298
    invoke-static {v3, v7, v9, v8, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 299
    .line 300
    .line 301
    return-object v9
.end method

.method private flushDeflater()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->flushDeflater()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private getEffectiveZip64Mode(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 2
    .line 3
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->AsNeeded:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 4
    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v1, 0x8

    .line 16
    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    const-wide/16 v2, -0x1

    .line 24
    .line 25
    cmp-long p1, v0, v2

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    :goto_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 34
    .line 35
    return-object p0
.end method

.method private getEntryEncoding(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {v0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 21
    .line 22
    return-object p0
.end method

.method private getGeneralPurposeBits(ZZ)Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    move p0, v1

    .line 17
    :goto_1
    invoke-virtual {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->useUTF8ForNames(Z)V

    .line 18
    .line 19
    .line 20
    if-eqz p2, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->useDataDescriptor(Z)V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-object v0
.end method

.method private getName(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getEntryEncoding(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private getZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 7
    .line 8
    xor-int/2addr v2, v1

    .line 9
    invoke-static {v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->h(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 13
    .line 14
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 21
    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 25
    .line 26
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;-><init>()V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-virtual {p1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->addAsFirstExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method private handleSizesAndCrc(JJLorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 16
    .line 17
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 29
    .line 30
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, p1, p2}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 38
    .line 39
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, p3, p4}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 44
    .line 45
    .line 46
    goto/16 :goto_0

    .line 47
    .line 48
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 49
    .line 50
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 51
    .line 52
    if-nez v0, :cond_3

    .line 53
    .line 54
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    cmp-long v0, v0, p3

    .line 63
    .line 64
    const-string v1, " instead of "

    .line 65
    .line 66
    const-string v2, ": "

    .line 67
    .line 68
    if-nez v0, :cond_2

    .line 69
    .line 70
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 71
    .line 72
    invoke-static {p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-virtual {p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 77
    .line 78
    .line 79
    move-result-wide p3

    .line 80
    cmp-long p3, p3, p1

    .line 81
    .line 82
    if-nez p3, :cond_1

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :cond_1
    new-instance p3, Ljava/util/zip/ZipException;

    .line 87
    .line 88
    iget-object p4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 89
    .line 90
    invoke-static {p4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 91
    .line 92
    .line 93
    move-result-object p4

    .line 94
    invoke-virtual {p4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p4

    .line 98
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 99
    .line 100
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 105
    .line 106
    .line 107
    move-result-wide v3

    .line 108
    new-instance p0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string p5, "Bad size for entry "

    .line 111
    .line 112
    invoke-direct {p0, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-direct {p3, p0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    throw p3

    .line 138
    :cond_2
    new-instance p1, Ljava/util/zip/ZipException;

    .line 139
    .line 140
    iget-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 141
    .line 142
    invoke-static {p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-virtual {p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 151
    .line 152
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 157
    .line 158
    .line 159
    move-result-wide v3

    .line 160
    invoke-static {v3, v4}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-static {p3, p4}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p3

    .line 168
    new-instance p4, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    const-string p5, "Bad CRC checksum for entry "

    .line 171
    .line 172
    invoke-direct {p4, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-direct {p1, p0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    throw p1

    .line 198
    :cond_3
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 206
    .line 207
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {v0, p1, p2}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 212
    .line 213
    .line 214
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 215
    .line 216
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-virtual {p1, p3, p4}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 221
    .line 222
    .line 223
    :goto_0
    invoke-direct {p0, p5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->checkIfNeedsZip64(Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)Z

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    return p0
.end method

.method private handleZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;JZ)V
    .locals 6

    .line 1
    if-eqz p4, :cond_6

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const-wide v2, 0xffffffffL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    if-gez v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    cmp-long v0, v0, v2

    .line 25
    .line 26
    if-gez v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 29
    .line 30
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 31
    .line 32
    if-ne v0, v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p4, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->setCompressedSize(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p4, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->setSize(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    :goto_0
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 46
    .line 47
    .line 48
    move-result-wide v4

    .line 49
    invoke-direct {v0, v4, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p4, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->setCompressedSize(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 56
    .line 57
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 58
    .line 59
    .line 60
    move-result-wide v4

    .line 61
    invoke-direct {v0, v4, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p4, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->setSize(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 65
    .line 66
    .line 67
    :goto_1
    cmp-long v0, p2, v2

    .line 68
    .line 69
    if-gez v0, :cond_2

    .line 70
    .line 71
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 72
    .line 73
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 74
    .line 75
    if-ne v0, v1, :cond_3

    .line 76
    .line 77
    :cond_2
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 78
    .line 79
    invoke-direct {v0, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p4, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->setRelativeHeaderOffset(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 83
    .line 84
    .line 85
    :cond_3
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDiskNumberStart()J

    .line 86
    .line 87
    .line 88
    move-result-wide p2

    .line 89
    const-wide/32 v0, 0xffff

    .line 90
    .line 91
    .line 92
    cmp-long p2, p2, v0

    .line 93
    .line 94
    if-gez p2, :cond_4

    .line 95
    .line 96
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 97
    .line 98
    sget-object p2, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 99
    .line 100
    if-ne p0, p2, :cond_5

    .line 101
    .line 102
    :cond_4
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 103
    .line 104
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDiskNumberStart()J

    .line 105
    .line 106
    .line 107
    move-result-wide p2

    .line 108
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>(J)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p4, p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->setDiskStartNumber(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V

    .line 112
    .line 113
    .line 114
    :cond_5
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 115
    .line 116
    .line 117
    :cond_6
    return-void
.end method

.method private hasZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z
    .locals 0

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
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private isTooLageForZip32(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide v2, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-gez p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    cmp-long p0, p0, v2

    .line 19
    .line 20
    if-ltz p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method private isZip64Required(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)Z
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 2
    .line 3
    if-eq p2, v0, :cond_1

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isTooLageForZip32(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method private preClose()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->e(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->EMPTY:[B

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p0, v0, v1, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->write([BII)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void

    .line 22
    :cond_1
    const-string p0, "No current entry to close"

    .line 23
    .line 24
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    const-string p0, "Stream has already been finished"

    .line 29
    .line 30
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private putArchiveEntry(Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;Z)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->closeArchiveEntry()V

    .line 10
    .line 11
    .line 12
    :cond_0
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 13
    .line 14
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-direct {v0, p1, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ll/spq0;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 21
    .line 22
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 32
    .line 33
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->setDefaults(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 41
    .line 42
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getEffectiveZip64Mode(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->validateSizeInformation(Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 54
    .line 55
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->shouldAddZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 66
    .line 67
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    if-eqz p2, :cond_1

    .line 76
    .line 77
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 78
    .line 79
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 80
    .line 81
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 86
    .line 87
    .line 88
    move-result-wide v2

    .line 89
    invoke-direct {v1, v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 90
    .line 91
    .line 92
    new-instance v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 93
    .line 94
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 95
    .line 96
    invoke-static {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    invoke-direct {v2, v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 109
    .line 110
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_2

    .line 119
    .line 120
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 121
    .line 122
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 127
    .line 128
    .line 129
    move-result-wide v1

    .line 130
    const-wide/16 v3, -0x1

    .line 131
    .line 132
    cmp-long v1, v1, v3

    .line 133
    .line 134
    if-eqz v1, :cond_2

    .line 135
    .line 136
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 137
    .line 138
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 139
    .line 140
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 145
    .line 146
    .line 147
    move-result-wide v2

    .line 148
    invoke-direct {v1, v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 149
    .line 150
    .line 151
    :goto_0
    move-object v2, v1

    .line 152
    goto :goto_1

    .line 153
    :cond_2
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :goto_1
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->setSize(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->setCompressedSize(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 163
    .line 164
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 169
    .line 170
    .line 171
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 172
    .line 173
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    const/16 v1, 0x8

    .line 182
    .line 183
    if-ne v0, v1, :cond_4

    .line 184
    .line 185
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    .line 186
    .line 187
    if-eqz v0, :cond_4

    .line 188
    .line 189
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    .line 190
    .line 191
    iget v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Ljava/util/zip/Deflater;->setLevel(I)V

    .line 194
    .line 195
    .line 196
    const/4 v0, 0x0

    .line 197
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    .line 198
    .line 199
    :cond_4
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeLocalFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Z)V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :cond_5
    const-string p0, "Stream has already been finished"

    .line 204
    .line 205
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method private rewriteSizesAndCrc(Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/nio/channels/SeekableByteChannel;->position()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 8
    .line 9
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 10
    .line 11
    invoke-static {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->f(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    invoke-interface {v2, v3, v4}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 19
    .line 20
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    invoke-static {v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 36
    .line 37
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-direct {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    if-nez p1, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 51
    .line 52
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 68
    .line 69
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 74
    .line 75
    .line 76
    move-result-wide v2

    .line 77
    invoke-static {v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 82
    .line 83
    .line 84
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 85
    .line 86
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 91
    .line 92
    .line 93
    move-result-wide v2

    .line 94
    invoke-static {v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 99
    .line 100
    .line 101
    :goto_1
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 102
    .line 103
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-direct {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_2

    .line 112
    .line 113
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 114
    .line 115
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-direct {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getName(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    sub-int/2addr v3, v2

    .line 132
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 133
    .line 134
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 135
    .line 136
    invoke-static {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->f(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J

    .line 137
    .line 138
    .line 139
    move-result-wide v4

    .line 140
    const-wide/16 v6, 0x10

    .line 141
    .line 142
    add-long/2addr v4, v6

    .line 143
    int-to-long v6, v3

    .line 144
    add-long/2addr v4, v6

    .line 145
    const-wide/16 v6, 0x4

    .line 146
    .line 147
    add-long/2addr v4, v6

    .line 148
    invoke-interface {v2, v4, v5}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 149
    .line 150
    .line 151
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 152
    .line 153
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 158
    .line 159
    .line 160
    move-result-wide v2

    .line 161
    invoke-static {v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-virtual {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 166
    .line 167
    .line 168
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 169
    .line 170
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 175
    .line 176
    .line 177
    move-result-wide v2

    .line 178
    invoke-static {v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 183
    .line 184
    .line 185
    if-nez p1, :cond_2

    .line 186
    .line 187
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 188
    .line 189
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 190
    .line 191
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->f(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J

    .line 192
    .line 193
    .line 194
    move-result-wide v2

    .line 195
    const-wide/16 v4, 0xa

    .line 196
    .line 197
    sub-long/2addr v2, v4

    .line 198
    invoke-interface {p1, v2, v3}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 202
    .line 203
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    const/4 v2, 0x0

    .line 212
    invoke-direct {p0, p1, v2, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->versionNeededToExtract(IZZ)I

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 224
    .line 225
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    sget-object v3, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 230
    .line 231
    invoke-virtual {p1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->removeExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 235
    .line 236
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 241
    .line 242
    .line 243
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 244
    .line 245
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-eqz p1, :cond_2

    .line 250
    .line 251
    iput-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 252
    .line 253
    :cond_2
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 254
    .line 255
    invoke-interface {p0, v0, v1}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 256
    .line 257
    .line 258
    return-void
.end method

.method private setDefaults(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->method:I

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setMethod(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getTime()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/16 v2, -0x1

    .line 18
    .line 19
    cmp-long p0, v0, v2

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-virtual {p1, v0, v1}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method private shouldAddZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)Z
    .locals 4

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 2
    .line 3
    if-eq p2, v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide v2, 0xffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-gez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    cmp-long v0, v0, v2

    .line 23
    .line 24
    if-gez v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    const-wide/16 v2, -0x1

    .line 31
    .line 32
    cmp-long p1, v0, v2

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 41
    .line 42
    if-eq p2, p0, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0

    .line 47
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 48
    return p0
.end method

.method private shouldUseZip64EOCD()Z
    .locals 8

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 7
    .line 8
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 9
    .line 10
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentIndex()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    move v2, v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 31
    .line 32
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    :goto_1
    const v3, 0xffff

    .line 47
    .line 48
    .line 49
    if-ge v0, v3, :cond_3

    .line 50
    .line 51
    iget-wide v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdDiskNumberStart:J

    .line 52
    .line 53
    const-wide/32 v6, 0xffff

    .line 54
    .line 55
    .line 56
    cmp-long v0, v4, v6

    .line 57
    .line 58
    if-gez v0, :cond_3

    .line 59
    .line 60
    if-ge v2, v3, :cond_3

    .line 61
    .line 62
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-ge v0, v3, :cond_3

    .line 69
    .line 70
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 71
    .line 72
    const-wide v4, 0xffffffffL

    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    cmp-long v0, v2, v4

    .line 78
    .line 79
    if-gez v0, :cond_3

    .line 80
    .line 81
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 82
    .line 83
    cmp-long p0, v2, v4

    .line 84
    .line 85
    if-ltz p0, :cond_2

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_2
    return v1

    .line 89
    :cond_3
    :goto_2
    const/4 p0, 0x1

    .line 90
    return p0
.end method

.method private usesDataDescriptor(IZ)Z
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const/16 p2, 0x8

    .line 4
    .line 5
    if-ne p1, p2, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private validateIfZip64IsNeededInEOCD()V
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 2
    .line 3
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 14
    .line 15
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentIndex()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v0, v1

    .line 23
    :goto_0
    const v2, 0xffff

    .line 24
    .line 25
    .line 26
    if-ge v0, v2, :cond_8

    .line 27
    .line 28
    iget-wide v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdDiskNumberStart:J

    .line 29
    .line 30
    const-wide/32 v5, 0xffff

    .line 31
    .line 32
    .line 33
    cmp-long v3, v3, v5

    .line 34
    .line 35
    if-gez v3, :cond_7

    .line 36
    .line 37
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    if-nez v3, :cond_2

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 51
    .line 52
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    :goto_1
    if-ge v1, v2, :cond_6

    .line 67
    .line 68
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-ge v0, v2, :cond_5

    .line 75
    .line 76
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 77
    .line 78
    const-wide v2, 0xffffffffL

    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    cmp-long v0, v0, v2

    .line 84
    .line 85
    if-gez v0, :cond_4

    .line 86
    .line 87
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 88
    .line 89
    cmp-long p0, v0, v2

    .line 90
    .line 91
    if-gez p0, :cond_3

    .line 92
    .line 93
    :goto_2
    return-void

    .line 94
    :cond_3
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;

    .line 95
    .line 96
    const-string v0, "Archive\'s size exceeds the limit of 4GByte."

    .line 97
    .line 98
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    throw p0

    .line 102
    :cond_4
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;

    .line 103
    .line 104
    const-string v0, "The size of the entire central directory exceeds the limit of 4GByte."

    .line 105
    .line 106
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    throw p0

    .line 110
    :cond_5
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;

    .line 111
    .line 112
    const-string v0, "Archive contains more than 65535 entries."

    .line 113
    .line 114
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    throw p0

    .line 118
    :cond_6
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;

    .line 119
    .line 120
    const-string v0, "Number of entries on this disk exceeds the limmit of 65535."

    .line 121
    .line 122
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    throw p0

    .line 126
    :cond_7
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;

    .line 127
    .line 128
    const-string v0, "Number of the disk with the start of Central Directory exceeds the limmit of 65535."

    .line 129
    .line 130
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    throw p0

    .line 134
    :cond_8
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;

    .line 135
    .line 136
    const-string v0, "Number of the disk of End Of Central Directory exceeds the limmit of 65535."

    .line 137
    .line 138
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    throw p0
.end method

.method private validateSizeInformation(Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 18
    .line 19
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    const-wide/16 v2, -0x1

    .line 28
    .line 29
    cmp-long v0, v0, v2

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 34
    .line 35
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    cmp-long v0, v0, v2

    .line 44
    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 48
    .line 49
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 54
    .line 55
    .line 56
    move-result-wide v1

    .line 57
    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    new-instance p0, Ljava/util/zip/ZipException;

    .line 62
    .line 63
    const-string p1, "CRC checksum is required for STORED method when not writing to a file"

    .line 64
    .line 65
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    throw p0

    .line 69
    :cond_1
    new-instance p0, Ljava/util/zip/ZipException;

    .line 70
    .line 71
    const-string p1, "Uncompressed size is required for STORED method when not writing to a file"

    .line 72
    .line 73
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    throw p0

    .line 77
    :cond_2
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 78
    .line 79
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 84
    .line 85
    .line 86
    move-result-wide v0

    .line 87
    const-wide v2, 0xffffffffL

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    cmp-long v0, v0, v2

    .line 93
    .line 94
    if-gez v0, :cond_3

    .line 95
    .line 96
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 97
    .line 98
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 103
    .line 104
    .line 105
    move-result-wide v0

    .line 106
    cmp-long v0, v0, v2

    .line 107
    .line 108
    if-ltz v0, :cond_4

    .line 109
    .line 110
    :cond_3
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 111
    .line 112
    if-eq p1, v0, :cond_5

    .line 113
    .line 114
    :cond_4
    return-void

    .line 115
    :cond_5
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;

    .line 116
    .line 117
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 118
    .line 119
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;->getEntryTooBigMessage(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-direct {p1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    throw p1
.end method

.method private versionNeededToExtract(IZZ)I
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/16 p0, 0x2d

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    if-eqz p3, :cond_1

    .line 7
    .line 8
    const/16 p0, 0x14

    .line 9
    .line 10
    return p0

    .line 11
    :cond_1
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->versionNeededToExtractMethod(I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private versionNeededToExtractMethod(I)I
    .locals 0

    const/16 p0, 0x8

    if-ne p1, p0, :cond_0

    const/16 p0, 0x14

    return p0

    :cond_0
    const/16 p0, 0xa

    return p0
.end method

.method private writeCentralDirectoryInChunks()V
    .locals 5

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    const v1, 0x11170

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    :goto_0
    move v3, v2

    .line 17
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 28
    .line 29
    invoke-direct {p0, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createCentralFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)[B

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v0, v4}, Ljava/io/OutputStream;->write([B)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v3, v3, 0x1

    .line 37
    .line 38
    const/16 v4, 0x3e8

    .line 39
    .line 40
    if-le v3, v4, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-direct {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private writeCounted([B)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->writeCounted([B)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private writeLocalFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Z)V
    .locals 9

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v5

    .line 11
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getName(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 16
    .line 17
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    invoke-direct {p0, p1, v5, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->addUnicodeExtraFields(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;ZLjava/nio/ByteBuffer;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 25
    .line 26
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 35
    .line 36
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 37
    .line 38
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentIndex()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    int-to-long v1, v1

    .line 43
    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setDiskNumberStart(J)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentBytesWritten()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    :cond_1
    move-object v2, p0

    .line 51
    move-object v3, p1

    .line 52
    move v6, p2

    .line 53
    move-wide v7, v0

    .line 54
    invoke-direct/range {v2 .. v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createLocalFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ljava/nio/ByteBuffer;ZZJ)[B

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    move-wide v0, v7

    .line 59
    iget-object p1, v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->metaData:Ljava/util/Map;

    .line 60
    .line 61
    new-instance p2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;

    .line 62
    .line 63
    invoke-virtual {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    invoke-direct {v2, v4, v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->usesDataDescriptor(IZ)Z

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    const/4 v5, 0x0

    .line 72
    invoke-direct {p2, v0, v1, v4, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$EntryMetaData;-><init>(JZLl/spq0;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {p1, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    iget-object p1, v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 79
    .line 80
    const-wide/16 v3, 0xe

    .line 81
    .line 82
    add-long v7, v0, v3

    .line 83
    .line 84
    invoke-static {p1, v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->k(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)V

    .line 85
    .line 86
    .line 87
    invoke-direct {v2, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 88
    .line 89
    .line 90
    iget-object p0, v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 91
    .line 92
    iget-object p1, v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 93
    .line 94
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    .line 95
    .line 96
    .line 97
    move-result-wide p1

    .line 98
    invoke-static {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->i(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)V

    .line 99
    .line 100
    .line 101
    return-void
.end method


# virtual methods
.method public addRawArchiveEntry(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ljava/io/InputStream;)V
    .locals 5

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->removeExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    const-wide/16 v3, -0x1

    .line 22
    .line 23
    cmp-long p1, v1, v3

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    cmp-long p1, v1, v3

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 36
    .line 37
    .line 38
    move-result-wide v1

    .line 39
    cmp-long p1, v1, v3

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    const/4 p1, 0x1

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 p1, 0x0

    .line 46
    :goto_0
    invoke-direct {p0, v0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->putArchiveEntry(Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;Z)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->copyFromZipInputStream(Ljava/io/InputStream;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->closeCopiedEntry(Z)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public canWriteEntryData(Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;)Z
    .locals 2

    .line 1
    instance-of p0, p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 7
    .line 8
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->IMPLODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 13
    .line 14
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eq p0, v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->UNSHRINKING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 25
    .line 26
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eq p0, v1, :cond_0

    .line 31
    .line 32
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->canHandleEntryData(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    return v0
.end method

.method public close()V
    .locals 1

    .line 1
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finish()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->destroy()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :goto_1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->destroy()V

    .line 16
    .line 17
    .line 18
    throw v0
.end method

.method public closeArchiveEntry()V
    .locals 10

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->preClose()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->flushDeflater()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 14
    .line 15
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->c(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    sub-long v5, v0, v2

    .line 20
    .line 21
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 22
    .line 23
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getCrc32()J

    .line 24
    .line 25
    .line 26
    move-result-wide v7

    .line 27
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 28
    .line 29
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 30
    .line 31
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getBytesRead()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    invoke-static {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->g(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 39
    .line 40
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->getEffectiveZip64Mode(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 45
    .line 46
    .line 47
    move-result-object v9

    .line 48
    move-object v4, p0

    .line 49
    invoke-direct/range {v4 .. v9}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->handleSizesAndCrc(JJLorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-direct {v4, p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->closeEntry(ZZ)V

    .line 55
    .line 56
    .line 57
    iget-object p0, v4, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 58
    .line 59
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->reset()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public createArchiveEntry(Ljava/io/File;Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "Stream has already been finished"

    .line 12
    .line 13
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public final deflate()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->deflate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/nio/channels/Channel;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    :goto_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void

    .line 19
    :goto_1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 24
    .line 25
    .line 26
    :cond_2
    throw v0
.end method

.method public finish()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 10
    .line 11
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 16
    .line 17
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 22
    .line 23
    check-cast v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 24
    .line 25
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentBytesWritten()J

    .line 26
    .line 27
    .line 28
    move-result-wide v3

    .line 29
    iput-wide v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 30
    .line 31
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentIndex()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    int-to-long v2, v2

    .line 36
    iput-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdDiskNumberStart:J

    .line 37
    .line 38
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCentralDirectoryInChunks()V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 42
    .line 43
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    sub-long/2addr v2, v0

    .line 48
    iput-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 49
    .line 50
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 51
    .line 52
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    .line 53
    .line 54
    invoke-interface {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    int-to-long v1, v1

    .line 63
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    int-to-long v3, v0

    .line 68
    sub-long/2addr v1, v3

    .line 69
    const-wide/16 v3, 0x16

    .line 70
    .line 71
    add-long/2addr v1, v3

    .line 72
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->eocdLength:J

    .line 73
    .line 74
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeZip64CentralDirectory()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCentralDirectoryEnd()V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->metaData:Ljava/util/Map;

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 91
    .line 92
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->close()V

    .line 93
    .line 94
    .line 95
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 96
    .line 97
    if-eqz v0, :cond_1

    .line 98
    .line 99
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 102
    .line 103
    .line 104
    :cond_1
    const/4 v0, 0x1

    .line 105
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    const-string p0, "This archive contains unclosed entries."

    .line 109
    .line 110
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_3
    const-string p0, "This archive has already been finished"

    .line 115
    .line 116
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public flush()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isSeekable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->channel:Ljava/nio/channels/SeekableByteChannel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public putArchiveEntry(Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;)V
    .locals 1

    const/4 v0, 0x0

    .line 209
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->putArchiveEntry(Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;Z)V

    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCreateUnicodeExtraFields(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 2
    .line 3
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 8
    .line 9
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->isUTF8(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public setFallbackToUTF8(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLevel(I)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-lt p1, v0, :cond_1

    .line 3
    .line 4
    const/16 v0, 0x9

    .line 5
    .line 6
    if-gt p1, v0, :cond_1

    .line 7
    .line 8
    iget v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 9
    .line 10
    if-ne v0, p1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    .line 15
    .line 16
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    const-string p0, "Invalid compression level: "

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setMethod(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->method:I

    .line 2
    .line 3
    return-void
.end method

.method public setUseLanguageEncodingFlag(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->isUTF8(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    :goto_0
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 15
    .line 16
    return-void
.end method

.method public setUseZip64(Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 2
    .line 3
    return-void
.end method

.method public write([BII)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->checkRequestedFeatures(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 13
    .line 14
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 15
    .line 16
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, p1, p2, p3, v1}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->write([BIII)J

    .line 25
    .line 26
    .line 27
    move-result-wide p1

    .line 28
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/Suddo;->count(J)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const-string p0, "No current entry"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public writeCentralDirectoryEnd()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 10
    .line 11
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 12
    .line 13
    iget-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->eocdLength:J

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->prepareToWriteUnsplittableContent(J)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->validateIfZip64IsNeededInEOCD()V

    .line 19
    .line 20
    .line 21
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    .line 22
    .line 23
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 24
    .line 25
    .line 26
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 32
    .line 33
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 34
    .line 35
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentIndex()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move v0, v1

    .line 41
    :goto_0
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-direct {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 46
    .line 47
    .line 48
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdDiskNumberStart:J

    .line 49
    .line 50
    long-to-int v2, v2

    .line 51
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-direct {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    iget-boolean v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 65
    .line 66
    if-eqz v3, :cond_3

    .line 67
    .line 68
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 69
    .line 70
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    if-nez v3, :cond_2

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 82
    .line 83
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Ljava/lang/Integer;

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    goto :goto_1

    .line 98
    :cond_3
    move v1, v2

    .line 99
    :goto_1
    const v0, 0xffff

    .line 100
    .line 101
    .line 102
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-direct {p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 111
    .line 112
    .line 113
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 122
    .line 123
    .line 124
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 125
    .line 126
    const-wide v2, 0xffffffffL

    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 132
    .line 133
    .line 134
    move-result-wide v0

    .line 135
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 140
    .line 141
    .line 142
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 143
    .line 144
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 145
    .line 146
    .line 147
    move-result-wide v0

    .line 148
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 156
    .line 157
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    .line 158
    .line 159
    invoke-interface {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    sub-int/2addr v1, v2

    .line 172
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-direct {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 177
    .line 178
    .line 179
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 180
    .line 181
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    invoke-virtual {p0, v2, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->writeCounted([BII)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public writeCentralFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->createCentralFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public writeDataDescriptor(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->usesDataDescriptor(IZ)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->DD_SIG:[B

    .line 14
    .line 15
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public writeLocalFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V
    .locals 1

    const/4 v0, 0x0

    .line 102
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeLocalFileHeader(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Z)V

    return-void
.end method

.method public final writeOut([B)V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->writeOut([BII)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final writeOut([BII)V
    .locals 0

    .line 9
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->writeOut([BII)V

    return-void
.end method

.method public writeZip64CentralDirectory()V
    .locals 10

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 2
    .line 3
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/sudcompress/archivers/zip/Zip64Mode;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->shouldUseZip64EOCD()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iput-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 20
    .line 21
    :cond_1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    :goto_0
    return-void

    .line 26
    :cond_2
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 27
    .line 28
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 37
    .line 38
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 39
    .line 40
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentBytesWritten()J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentIndex()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    int-to-long v4, v0

    .line 49
    goto :goto_1

    .line 50
    :cond_3
    const-wide/16 v4, 0x0

    .line 51
    .line 52
    :goto_1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_SIG:[B

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 55
    .line 56
    .line 57
    const-wide/16 v6, 0x2c

    .line 58
    .line 59
    invoke-static {v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 64
    .line 65
    .line 66
    const/16 v0, 0x2d

    .line 67
    .line 68
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    invoke-virtual {p0, v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 80
    .line 81
    .line 82
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 83
    .line 84
    const/4 v6, 0x0

    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 88
    .line 89
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 90
    .line 91
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentIndex()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    goto :goto_2

    .line 96
    :cond_4
    move v0, v6

    .line 97
    :goto_2
    int-to-long v7, v0

    .line 98
    invoke-static {v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    invoke-virtual {p0, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 103
    .line 104
    .line 105
    iget-wide v7, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdDiskNumberStart:J

    .line 106
    .line 107
    invoke-static {v7, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    invoke-virtual {p0, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 112
    .line 113
    .line 114
    iget-boolean v7, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 115
    .line 116
    if-eqz v7, :cond_6

    .line 117
    .line 118
    iget-object v7, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 119
    .line 120
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v7

    .line 128
    if-nez v7, :cond_5

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_5
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->numberOfCDInDiskData:Ljava/util/Map;

    .line 132
    .line 133
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Ljava/lang/Integer;

    .line 142
    .line 143
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    goto :goto_3

    .line 148
    :cond_6
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 149
    .line 150
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    :goto_3
    int-to-long v6, v6

    .line 155
    invoke-static {v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 163
    .line 164
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    int-to-long v6, v0

    .line 169
    invoke-static {v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 174
    .line 175
    .line 176
    iget-wide v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 177
    .line 178
    invoke-static {v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 183
    .line 184
    .line 185
    iget-wide v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 186
    .line 187
    invoke-static {v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 192
    .line 193
    .line 194
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 195
    .line 196
    if-eqz v0, :cond_7

    .line 197
    .line 198
    iget-wide v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->eocdLength:J

    .line 199
    .line 200
    const-wide/16 v8, 0x14

    .line 201
    .line 202
    add-long/2addr v6, v8

    .line 203
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 204
    .line 205
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 206
    .line 207
    invoke-virtual {v0, v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->prepareToWriteUnsplittableContent(J)V

    .line 208
    .line 209
    .line 210
    :cond_7
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_LOC_SIG:[B

    .line 211
    .line 212
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 213
    .line 214
    .line 215
    invoke-static {v4, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 220
    .line 221
    .line 222
    invoke-static {v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 227
    .line 228
    .line 229
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->isSplitZip:Z

    .line 230
    .line 231
    if-eqz v0, :cond_8

    .line 232
    .line 233
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 234
    .line 235
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;

    .line 236
    .line 237
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->getCurrentSplitSegmentIndex()I

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    add-int/2addr v0, v1

    .line 242
    int-to-long v0, v0

    .line 243
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :cond_8
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->ONE:[B

    .line 252
    .line 253
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 254
    .line 255
    .line 256
    return-void
.end method
