.class public Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;
.super Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;,
        Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;
    }
.end annotation


# static fields
.field private static final APK_SIGNING_BLOCK_MAGIC:[B

.field private static final CFH:[B

.field private static final CFH_LEN:I = 0x2e

.field private static final DD:[B

.field private static final LFH:[B

.field private static final LFH_LEN:I = 0x1e

.field private static final LONG_MAX:Ljava/math/BigInteger;

.field private static final TWO_EXP_32:J = 0x100000000L

.field private static final USE_ZIPFILE_INSTEAD_OF_STREAM_DISCLAIMER:Ljava/lang/String; = " while reading a stored entry using data descriptor. Either the archive is broken or it can not be read using ZipArchiveInputStream and you must use ZipFile. A common cause for this is a ZIP archive containing a ZIP archive. See http://commons.apache.org/proper/commons-compress/zip.html#ZipArchiveInputStream_vs_ZipFile"


# instance fields
.field private allowStoredEntriesWithDataDescriptor:Z

.field private final buf:Ljava/nio/ByteBuffer;

.field private closed:Z

.field private current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

.field final encoding:Ljava/lang/String;

.field private entriesRead:I

.field private hitCentralDirectory:Z

.field private final in:Ljava/io/InputStream;

.field private final inf:Ljava/util/zip/Inflater;

.field private lastStoredEntry:Ljava/io/ByteArrayInputStream;

.field private final lfhBuf:[B

.field private final shortBuf:[B

.field private final skipBuf:[B

.field private final skipSplitSig:Z

.field private final twoDwordBuf:[B

.field private uncompressedCount:J

.field private final useUnicodeExtraFields:Z

.field private final wordBuf:[B

.field private final zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    .line 8
    .line 9
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 10
    .line 11
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->CFH:[B

    .line 16
    .line 17
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 18
    .line 19
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->DD:[B

    .line 24
    .line 25
    const/16 v0, 0x10

    .line 26
    .line 27
    new-array v0, v0, [B

    .line 28
    .line 29
    fill-array-data v0, :array_0

    .line 30
    .line 31
    .line 32
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->APK_SIGNING_BLOCK_MAGIC:[B

    .line 33
    .line 34
    const-wide v0, 0x7fffffffffffffffL

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->LONG_MAX:Ljava/math/BigInteger;

    .line 44
    .line 45
    return-void

    .line 46
    nop

    .line 47
    :array_0
    .array-data 1
        0x41t
        0x50t
        0x4bt
        0x20t
        0x53t
        0x69t
        0x67t
        0x20t
        0x42t
        0x6ct
        0x6ft
        0x63t
        0x6bt
        0x20t
        0x34t
        0x32t
    .end array-data
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    .line 98
    const-string v0, "UTF8"

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 95
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 96
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;ZZ)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    .line 97
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;ZZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;ZZZ)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/zip/Inflater;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 11
    .line 12
    const/16 v0, 0x200

    .line 13
    .line 14
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    iput-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 25
    .line 26
    iput-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->hitCentralDirectory:Z

    .line 27
    .line 28
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    .line 29
    .line 30
    iput-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->allowStoredEntriesWithDataDescriptor:Z

    .line 31
    .line 32
    const-wide/16 v3, 0x0

    .line 33
    .line 34
    iput-wide v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->uncompressedCount:J

    .line 35
    .line 36
    const/16 v1, 0x1e

    .line 37
    .line 38
    new-array v1, v1, [B

    .line 39
    .line 40
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 41
    .line 42
    const/16 v1, 0x400

    .line 43
    .line 44
    new-array v1, v1, [B

    .line 45
    .line 46
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->skipBuf:[B

    .line 47
    .line 48
    const/4 v1, 0x2

    .line 49
    new-array v1, v1, [B

    .line 50
    .line 51
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->shortBuf:[B

    .line 52
    .line 53
    const/4 v1, 0x4

    .line 54
    new-array v1, v1, [B

    .line 55
    .line 56
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->wordBuf:[B

    .line 57
    .line 58
    const/16 v1, 0x10

    .line 59
    .line 60
    new-array v1, v1, [B

    .line 61
    .line 62
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->twoDwordBuf:[B

    .line 63
    .line 64
    iput v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->entriesRead:I

    .line 65
    .line 66
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->encoding:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 73
    .line 74
    iput-boolean p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->useUnicodeExtraFields:Z

    .line 75
    .line 76
    new-instance p2, Ljava/io/PushbackInputStream;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    invoke-direct {p2, p1, p3}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 83
    .line 84
    .line 85
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 86
    .line 87
    iput-boolean p4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->allowStoredEntriesWithDataDescriptor:Z

    .line 88
    .line 89
    iput-boolean p5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->skipSplitSig:Z

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public static synthetic access$000(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->count(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->count(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    return-object p0
.end method

.method private bufferContainsSignature(Ljava/io/ByteArrayOutputStream;III)Z
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-nez v1, :cond_5

    .line 5
    .line 6
    add-int v3, p2, p3

    .line 7
    .line 8
    add-int/lit8 v4, v3, -0x4

    .line 9
    .line 10
    if-ge v2, v4, :cond_5

    .line 11
    .line 12
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    aget-byte v4, v4, v2

    .line 19
    .line 20
    sget-object v5, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    .line 21
    .line 22
    aget-byte v6, v5, v0

    .line 23
    .line 24
    if-ne v4, v6, :cond_4

    .line 25
    .line 26
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    add-int/lit8 v6, v2, 0x1

    .line 33
    .line 34
    aget-byte v4, v4, v6

    .line 35
    .line 36
    const/4 v6, 0x1

    .line 37
    aget-byte v7, v5, v6

    .line 38
    .line 39
    if-ne v4, v7, :cond_4

    .line 40
    .line 41
    const/4 v4, 0x2

    .line 42
    const/4 v7, 0x3

    .line 43
    if-lt v2, p4, :cond_0

    .line 44
    .line 45
    iget-object v8, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    add-int/lit8 v9, v2, 0x2

    .line 52
    .line 53
    aget-byte v8, v8, v9

    .line 54
    .line 55
    aget-byte v9, v5, v4

    .line 56
    .line 57
    if-ne v8, v9, :cond_0

    .line 58
    .line 59
    iget-object v8, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    add-int/lit8 v9, v2, 0x3

    .line 66
    .line 67
    aget-byte v8, v8, v9

    .line 68
    .line 69
    aget-byte v5, v5, v7

    .line 70
    .line 71
    if-eq v8, v5, :cond_1

    .line 72
    .line 73
    :cond_0
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 74
    .line 75
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    aget-byte v5, v5, v2

    .line 80
    .line 81
    sget-object v8, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->CFH:[B

    .line 82
    .line 83
    aget-byte v9, v8, v4

    .line 84
    .line 85
    if-ne v5, v9, :cond_2

    .line 86
    .line 87
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 88
    .line 89
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    add-int/lit8 v9, v2, 0x3

    .line 94
    .line 95
    aget-byte v5, v5, v9

    .line 96
    .line 97
    aget-byte v8, v8, v7

    .line 98
    .line 99
    if-ne v5, v8, :cond_2

    .line 100
    .line 101
    :cond_1
    sub-int v1, v2, p4

    .line 102
    .line 103
    move v4, v1

    .line 104
    :goto_1
    move v1, v6

    .line 105
    goto :goto_2

    .line 106
    :cond_2
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 107
    .line 108
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    add-int/lit8 v8, v2, 0x2

    .line 113
    .line 114
    aget-byte v5, v5, v8

    .line 115
    .line 116
    sget-object v8, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->DD:[B

    .line 117
    .line 118
    aget-byte v4, v8, v4

    .line 119
    .line 120
    if-ne v5, v4, :cond_3

    .line 121
    .line 122
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 123
    .line 124
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    add-int/lit8 v5, v2, 0x3

    .line 129
    .line 130
    aget-byte v4, v4, v5

    .line 131
    .line 132
    aget-byte v5, v8, v7

    .line 133
    .line 134
    if-ne v4, v5, :cond_3

    .line 135
    .line 136
    move v4, v2

    .line 137
    goto :goto_1

    .line 138
    :cond_3
    move v4, v2

    .line 139
    :goto_2
    if-eqz v1, :cond_4

    .line 140
    .line 141
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    sub-int/2addr v3, v4

    .line 148
    invoke-direct {p0, v5, v4, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->pushback([BII)V

    .line 149
    .line 150
    .line 151
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 152
    .line 153
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-virtual {p1, v3, v0, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 158
    .line 159
    .line 160
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readDataDescriptor()V

    .line 161
    .line 162
    .line 163
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :cond_5
    return v1
.end method

.method private cacheBytesRead(Ljava/io/ByteArrayOutputStream;III)I
    .locals 1

    .line 1
    add-int/2addr p2, p3

    .line 2
    sub-int p3, p2, p4

    .line 3
    .line 4
    add-int/lit8 p3, p3, -0x3

    .line 5
    .line 6
    if-lez p3, :cond_0

    .line 7
    .line 8
    iget-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p1, p2, v0, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    add-int/lit8 p4, p4, 0x3

    .line 31
    .line 32
    invoke-static {p1, p3, p0, v0, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 33
    .line 34
    .line 35
    return p4

    .line 36
    :cond_0
    return p2
.end method

.method private static checksig([B[B)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    array-length v2, p1

    .line 4
    if-ge v1, v2, :cond_1

    .line 5
    .line 6
    aget-byte v2, p0, v1

    .line 7
    .line 8
    aget-byte v3, p1, v1

    .line 9
    .line 10
    if-eq v2, v3, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private closeEntry()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->currentEntryHasOutstandingBytes()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->drainCurrentEntryData()V

    .line 17
    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    const-wide v0, 0x7fffffffffffffffL

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->skip(J)J

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 29
    .line 30
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/16 v1, 0x8

    .line 39
    .line 40
    if-ne v0, v1, :cond_2

    .line 41
    .line 42
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->getBytesInflated()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 48
    .line 49
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 54
    .line 55
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    sub-long/2addr v2, v0

    .line 60
    long-to-int v0, v2

    .line 61
    if-lez v0, :cond_3

    .line 62
    .line 63
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    sub-int/2addr v2, v0

    .line 76
    invoke-direct {p0, v1, v2, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->pushback([BII)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 80
    .line 81
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 82
    .line 83
    .line 84
    move-result-wide v2

    .line 85
    int-to-long v4, v0

    .line 86
    sub-long/2addr v2, v4

    .line 87
    invoke-static {v1, v2, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->i(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)V

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->currentEntryHasOutstandingBytes()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->drainCurrentEntryData()V

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    .line 100
    .line 101
    if-nez v0, :cond_5

    .line 102
    .line 103
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 104
    .line 105
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->e(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_5

    .line 110
    .line 111
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readDataDescriptor()V

    .line 112
    .line 113
    .line 114
    :cond_5
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->reset()V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ljava/nio/Buffer;->flip()Ljava/nio/Buffer;

    .line 126
    .line 127
    .line 128
    const/4 v0, 0x0

    .line 129
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 130
    .line 131
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    .line 132
    .line 133
    return-void

    .line 134
    :cond_6
    const-string p0, "The stream is closed"

    .line 135
    .line 136
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method private currentEntryHasOutstandingBytes()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    cmp-long v0, v1, v3

    .line 16
    .line 17
    if-gtz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 20
    .line 21
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->e(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method private drainCurrentEntryData()V
    .locals 8

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 12
    .line 13
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    sub-long/2addr v0, v2

    .line 18
    :goto_0
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    cmp-long v4, v0, v2

    .line 21
    .line 22
    if-lez v4, :cond_1

    .line 23
    .line 24
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 25
    .line 26
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    invoke-virtual {v6}, Ljava/nio/Buffer;->capacity()I

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    int-to-long v6, v6

    .line 39
    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 40
    .line 41
    .line 42
    move-result-wide v6

    .line 43
    long-to-int v6, v6

    .line 44
    const/4 v7, 0x0

    .line 45
    invoke-virtual {v4, v5, v7, v6}, Ljava/io/InputStream;->read([BII)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    int-to-long v4, v4

    .line 50
    cmp-long v2, v4, v2

    .line 51
    .line 52
    if-ltz v2, :cond_0

    .line 53
    .line 54
    invoke-virtual {p0, v4, v5}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->count(J)V

    .line 55
    .line 56
    .line 57
    sub-long/2addr v0, v4

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    .line 60
    .line 61
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 62
    .line 63
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Ll/sjg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v2, "Truncated ZIP entry: "

    .line 78
    .line 79
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-direct {v0, p0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    throw v0

    .line 93
    :cond_1
    return-void
.end method

.method private fill()I
    .locals 4

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 6
    .line 7
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0, v1}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->count(I)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 34
    .line 35
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-virtual {v1, v2, v3, p0}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return v0

    .line 52
    :cond_1
    const-string p0, "The stream is closed"

    .line 53
    .line 54
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    return p0
.end method

.method private findEocdRecord()V
    .locals 5

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v3, v0

    .line 4
    :goto_0
    move v2, v1

    .line 5
    :goto_1
    if-nez v2, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readOneByte()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-le v3, v0, :cond_7

    .line 12
    .line 13
    :cond_0
    invoke-direct {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->isFirstByteOfEocdSig(I)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readOneByte()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    aget-byte v4, v2, v4

    .line 28
    .line 29
    if-eq v3, v4, :cond_3

    .line 30
    .line 31
    if-ne v3, v0, :cond_2

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    invoke-direct {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->isFirstByteOfEocdSig(I)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    goto :goto_1

    .line 39
    :cond_3
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readOneByte()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v4, 0x2

    .line 44
    aget-byte v4, v2, v4

    .line 45
    .line 46
    if-eq v3, v4, :cond_5

    .line 47
    .line 48
    if-ne v3, v0, :cond_4

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_4
    invoke-direct {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->isFirstByteOfEocdSig(I)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    goto :goto_1

    .line 56
    :cond_5
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readOneByte()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eq v3, v0, :cond_7

    .line 61
    .line 62
    const/4 v4, 0x3

    .line 63
    aget-byte v2, v2, v4

    .line 64
    .line 65
    if-ne v3, v2, :cond_6

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_6
    invoke-direct {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->isFirstByteOfEocdSig(I)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    goto :goto_1

    .line 73
    :cond_7
    :goto_2
    return-void
.end method

.method private getBytesInflated()J
    .locals 8

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->getBytesRead()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 8
    .line 9
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    const-wide v4, 0x100000000L

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    cmp-long v2, v2, v4

    .line 19
    .line 20
    if-ltz v2, :cond_0

    .line 21
    .line 22
    :goto_0
    add-long v2, v0, v4

    .line 23
    .line 24
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 25
    .line 26
    invoke-static {v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 27
    .line 28
    .line 29
    move-result-wide v6

    .line 30
    cmp-long v6, v2, v6

    .line 31
    .line 32
    if-gtz v6, :cond_0

    .line 33
    .line 34
    move-wide v0, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-wide v0
.end method

.method private isApkSigningBlock([B)Z
    .locals 7

    .line 1
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getValue([B)Ljava/math/BigInteger;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, p1

    .line 6
    const/16 v2, 0x8

    .line 7
    .line 8
    rsub-int/lit8 v1, v1, 0x8

    .line 9
    .line 10
    int-to-long v3, v1

    .line 11
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->APK_SIGNING_BLOCK_MAGIC:[B

    .line 12
    .line 13
    array-length v5, v1

    .line 14
    int-to-long v5, v5

    .line 15
    sub-long/2addr v3, v5

    .line 16
    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v0, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    array-length v1, v1

    .line 25
    new-array v3, v1, [B

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    :try_start_0
    invoke-virtual {v0}, Ljava/math/BigInteger;->signum()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-gez v5, :cond_1

    .line 33
    .line 34
    array-length v5, p1

    .line 35
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    add-int/2addr v5, v6

    .line 40
    if-ge v5, v2, :cond_0

    .line 41
    .line 42
    return v4

    .line 43
    :cond_0
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-static {p1, v5, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    .line 57
    .line 58
    if-ge v0, v1, :cond_3

    .line 59
    .line 60
    invoke-direct {p0, v3, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([BI)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    :goto_0
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->LONG_MAX:Ljava/math/BigInteger;

    .line 65
    .line 66
    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-lez v1, :cond_2

    .line 71
    .line 72
    const-wide v1, 0x7fffffffffffffffL

    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    invoke-direct {p0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->realSkip(J)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    goto :goto_0

    .line 89
    :cond_2
    invoke-virtual {v0}, Ljava/math/BigInteger;->longValue()J

    .line 90
    .line 91
    .line 92
    move-result-wide v0

    .line 93
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->realSkip(J)V

    .line 94
    .line 95
    .line 96
    invoke-direct {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([B)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .line 98
    .line 99
    :cond_3
    :goto_1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->APK_SIGNING_BLOCK_MAGIC:[B

    .line 100
    .line 101
    invoke-static {v3, p0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    return p0

    .line 106
    :catch_0
    return v4
.end method

.method private isFirstByteOfEocdSig(I)Z
    .locals 1

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-byte p0, p0, v0

    .line 5
    .line 6
    if-ne p1, p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    return v0
.end method

.method public static matches([BI)Z
    .locals 3

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ge p1, v1, :cond_0

    .line 6
    .line 7
    return v2

    .line 8
    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->checksig([B[B)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_2

    .line 13
    .line 14
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    .line 15
    .line 16
    invoke-static {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->checksig([B[B)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->DD_SIG:[B

    .line 23
    .line 24
    invoke-static {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->checksig([B[B)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->SINGLE_SEGMENT_SPLIT_MARKER:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 31
    .line 32
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->checksig([B[B)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return v2

    .line 44
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method private processZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 14
    .line 15
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v2, 0x0

    .line 22
    :goto_0
    invoke-static {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->l(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->e(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_3

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 34
    .line 35
    invoke-virtual {v1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_1

    .line 40
    .line 41
    invoke-virtual {v1, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    :cond_1
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 48
    .line 49
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->getCompressedSize()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    .line 58
    .line 59
    .line 60
    move-result-wide v1

    .line 61
    invoke-virtual {p1, v1, v2}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 65
    .line 66
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->getSize()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    .line 75
    .line 76
    .line 77
    move-result-wide p1

    .line 78
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    if-eqz p2, :cond_3

    .line 83
    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 87
    .line 88
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue()J

    .line 93
    .line 94
    .line 95
    move-result-wide v1

    .line 96
    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 100
    .line 101
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue()J

    .line 106
    .line 107
    .line 108
    move-result-wide p1

    .line 109
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 110
    .line 111
    .line 112
    :cond_3
    return-void
.end method

.method private pushback([BII)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 2
    .line 3
    check-cast v0, Ljava/io/PushbackInputStream;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/PushbackInputStream;->unread([BII)V

    .line 6
    .line 7
    .line 8
    int-to-long p1, p3

    .line 9
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->pushedBackBytes(J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private readDataDescriptor()V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->wordBuf:[B

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 7
    .line 8
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->wordBuf:[B

    .line 9
    .line 10
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([B)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->wordBuf:[B

    .line 22
    .line 23
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 27
    .line 28
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->wordBuf:[B

    .line 29
    .line 30
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([B)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 34
    .line 35
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue()J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    invoke-virtual {v1, v2, v3}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->twoDwordBuf:[B

    .line 47
    .line 48
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 52
    .line 53
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->twoDwordBuf:[B

    .line 54
    .line 55
    const/16 v2, 0x8

    .line 56
    .line 57
    invoke-direct {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([BI)V

    .line 58
    .line 59
    .line 60
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_2

    .line 67
    .line 68
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 78
    .line 79
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->twoDwordBuf:[B

    .line 84
    .line 85
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue([B)J

    .line 86
    .line 87
    .line 88
    move-result-wide v3

    .line 89
    invoke-virtual {v0, v3, v4}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 93
    .line 94
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->twoDwordBuf:[B

    .line 99
    .line 100
    invoke-static {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue([BI)J

    .line 101
    .line 102
    .line 103
    move-result-wide v1

    .line 104
    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->twoDwordBuf:[B

    .line 109
    .line 110
    invoke-direct {p0, v0, v2, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->pushback([BII)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 114
    .line 115
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->twoDwordBuf:[B

    .line 120
    .line 121
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([B)J

    .line 122
    .line 123
    .line 124
    move-result-wide v1

    .line 125
    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 129
    .line 130
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->twoDwordBuf:[B

    .line 135
    .line 136
    const/4 v1, 0x4

    .line 137
    invoke-static {p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 138
    .line 139
    .line 140
    move-result-wide v1

    .line 141
    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method private readDeflated([BII)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFromInflater([BII)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-gtz p1, :cond_3

    .line 6
    .line 7
    iget-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/util/zip/Inflater;->finished()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const/4 p3, -0x1

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    return p3

    .line 17
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/util/zip/Inflater;->needsDictionary()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_2

    .line 24
    .line 25
    if-eq p1, p3, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const-string p0, "Truncated ZIP file"

    .line 29
    .line 30
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_2
    new-instance p0, Ljava/util/zip/ZipException;

    .line 36
    .line 37
    const-string p1, "This archive needs a preset dictionary which is not supported by Commons Compress."

    .line 38
    .line 39
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw p0

    .line 43
    :cond_3
    :goto_0
    return p1
.end method

.method private readFirstLocalFileHeader([B)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([B)V

    .line 7
    .line 8
    .line 9
    iget-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->skipSplitSig:Z

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;

    .line 23
    .line 24
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->SPLITTING:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 25
    .line 26
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;)V

    .line 27
    .line 28
    .line 29
    throw p0

    .line 30
    :cond_1
    :goto_0
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->SINGLE_SEGMENT_SPLIT_MARKER:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_3

    .line 37
    .line 38
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    return-void

    .line 48
    :cond_3
    :goto_1
    const/4 v0, 0x4

    .line 49
    new-array v1, v0, [B

    .line 50
    .line 51
    invoke-direct {p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    const/16 v2, 0x1a

    .line 56
    .line 57
    invoke-static {p1, v0, p1, p0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, p0, p1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method private readFromInflater([BII)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/zip/Inflater;->needsInput()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_3

    .line 9
    .line 10
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->fill()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-lez v1, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 17
    .line 18
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/nio/Buffer;->limit()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    int-to-long v3, v3

    .line 29
    add-long/2addr v1, v3

    .line 30
    invoke-static {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->i(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 p0, -0x1

    .line 35
    if-ne v1, p0, :cond_2

    .line 36
    .line 37
    return p0

    .line 38
    :cond_2
    return v0

    .line 39
    :cond_3
    :goto_0
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 40
    .line 41
    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/Inflater;->inflate([BII)I

    .line 42
    .line 43
    .line 44
    move-result v0
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/util/zip/Inflater;->needsInput()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_0

    .line 54
    .line 55
    :cond_4
    return v0

    .line 56
    :catch_0
    move-exception p0

    .line 57
    new-instance p1, Ljava/util/zip/ZipException;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-direct {p1, p2}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Ljava/io/IOException;

    .line 71
    .line 72
    throw p0
.end method

.method private readFully([B)V
    .locals 1

    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([BI)V

    return-void
.end method

.method private readFully([BI)V
    .locals 2

    .line 1
    array-length v0, p1

    .line 2
    sub-int/2addr v0, p2

    .line 3
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 4
    .line 5
    invoke-static {v1, p1, p2, v0}, Ll/xeg0;->a(Ljava/io/InputStream;[BII)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->count(I)V

    .line 10
    .line 11
    .line 12
    if-lt p1, v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private readOneByte()I
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {p0, v1}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->count(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return v0
.end method

.method private readStored([BII)I
    .locals 8

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->e(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readStoredEntry()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/ByteArrayInputStream;->read([BII)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 32
    .line 33
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    cmp-long v2, v2, v0

    .line 38
    .line 39
    const/4 v3, -0x1

    .line 40
    if-ltz v2, :cond_2

    .line 41
    .line 42
    return v3

    .line 43
    :cond_2
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 50
    .line 51
    invoke-virtual {v4}, Ljava/nio/Buffer;->limit()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-lt v2, v4, :cond_4

    .line 56
    .line 57
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    const/4 v4, 0x0

    .line 60
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 64
    .line 65
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-virtual {v2, v5}, Ljava/io/InputStream;->read([B)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    if-eq v2, v3, :cond_3

    .line 78
    .line 79
    invoke-virtual {v5, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v2}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->count(I)V

    .line 83
    .line 84
    .line 85
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 86
    .line 87
    invoke-static {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 88
    .line 89
    .line 90
    move-result-wide v4

    .line 91
    int-to-long v6, v2

    .line 92
    add-long/2addr v4, v6

    .line 93
    invoke-static {v3, v4, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->i(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    invoke-virtual {v5, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 98
    .line 99
    .line 100
    const-string p0, "Truncated ZIP file"

    .line 101
    .line 102
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    const/4 p0, 0x0

    .line 106
    return p0

    .line 107
    :cond_4
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    .line 114
    .line 115
    .line 116
    move-result p3

    .line 117
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 118
    .line 119
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 120
    .line 121
    .line 122
    move-result-wide v2

    .line 123
    sub-long/2addr v0, v2

    .line 124
    int-to-long v2, p3

    .line 125
    cmp-long v2, v0, v2

    .line 126
    .line 127
    if-gez v2, :cond_5

    .line 128
    .line 129
    long-to-int p3, v0

    .line 130
    :cond_5
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 131
    .line 132
    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 136
    .line 137
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 138
    .line 139
    .line 140
    move-result-wide p1

    .line 141
    int-to-long v0, p3

    .line 142
    add-long/2addr p1, v0

    .line 143
    invoke-static {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->h(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)V

    .line 144
    .line 145
    .line 146
    return p3
.end method

.method private readStoredEntry()V
    .locals 7

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 7
    .line 8
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->g(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const/16 v1, 0x14

    .line 16
    .line 17
    :goto_0
    move v3, v2

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    const/16 v1, 0xc

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    :goto_1
    if-nez v2, :cond_4

    .line 23
    .line 24
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 25
    .line 26
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    rsub-int v6, v3, 0x200

    .line 33
    .line 34
    invoke-virtual {v4, v5, v3, v6}, Ljava/io/InputStream;->read([BII)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-lez v4, :cond_3

    .line 39
    .line 40
    add-int v5, v4, v3

    .line 41
    .line 42
    const/4 v6, 0x4

    .line 43
    if-ge v5, v6, :cond_2

    .line 44
    .line 45
    move v3, v5

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    invoke-direct {p0, v0, v3, v4, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->bufferContainsSignature(Ljava/io/ByteArrayOutputStream;III)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_1

    .line 52
    .line 53
    invoke-direct {p0, v0, v3, v4, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->cacheBytesRead(Ljava/io/ByteArrayOutputStream;III)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    goto :goto_1

    .line 58
    :cond_3
    const-string p0, "Truncated ZIP file"

    .line 59
    .line 60
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_4
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 65
    .line 66
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 71
    .line 72
    .line 73
    move-result-wide v1

    .line 74
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 75
    .line 76
    invoke-static {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    cmp-long v1, v1, v3

    .line 85
    .line 86
    if-nez v1, :cond_6

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    array-length v1, v0

    .line 93
    int-to-long v1, v1

    .line 94
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 95
    .line 96
    invoke-static {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    cmp-long v1, v1, v3

    .line 105
    .line 106
    if-nez v1, :cond_5

    .line 107
    .line 108
    new-instance v1, Ljava/io/ByteArrayInputStream;

    .line 109
    .line 110
    invoke-direct {v1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 111
    .line 112
    .line 113
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    .line 114
    .line 115
    return-void

    .line 116
    :cond_5
    new-instance p0, Ljava/util/zip/ZipException;

    .line 117
    .line 118
    const-string v0, "actual and claimed size don\'t match while reading a stored entry using data descriptor. Either the archive is broken or it can not be read using ZipArchiveInputStream and you must use ZipFile. A common cause for this is a ZIP archive containing a ZIP archive. See http://commons.apache.org/proper/commons-compress/zip.html#ZipArchiveInputStream_vs_ZipFile"

    .line 119
    .line 120
    invoke-direct {p0, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    throw p0

    .line 124
    :cond_6
    new-instance p0, Ljava/util/zip/ZipException;

    .line 125
    .line 126
    const-string v0, "compressed and uncompressed size don\'t match while reading a stored entry using data descriptor. Either the archive is broken or it can not be read using ZipArchiveInputStream and you must use ZipFile. A common cause for this is a ZIP archive containing a ZIP archive. See http://commons.apache.org/proper/commons-compress/zip.html#ZipArchiveInputStream_vs_ZipFile"

    .line 127
    .line 128
    invoke-direct {p0, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    throw p0
.end method

.method private realSkip(J)V
    .locals 8

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-ltz v2, :cond_3

    .line 6
    .line 7
    :goto_0
    cmp-long v2, v0, p1

    .line 8
    .line 9
    if-gez v2, :cond_2

    .line 10
    .line 11
    sub-long v2, p1, v0

    .line 12
    .line 13
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 14
    .line 15
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->skipBuf:[B

    .line 16
    .line 17
    array-length v6, v5

    .line 18
    int-to-long v6, v6

    .line 19
    cmp-long v6, v6, v2

    .line 20
    .line 21
    if-lez v6, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    array-length v2, v5

    .line 25
    int-to-long v2, v2

    .line 26
    :goto_1
    long-to-int v2, v2

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {v4, v5, v3, v2}, Ljava/io/InputStream;->read([BII)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/4 v3, -0x1

    .line 33
    if-ne v2, v3, :cond_1

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_1
    invoke-virtual {p0, v2}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->count(I)V

    .line 37
    .line 38
    .line 39
    int-to-long v2, v2

    .line 40
    add-long/2addr v0, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    :goto_2
    return-void

    .line 43
    :cond_3
    invoke-static {}, Ll/fig0;->a()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private skipRemainderOfArchive()V
    .locals 4

    .line 1
    iget v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->entriesRead:I

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide/16 v2, 0x2e

    .line 5
    .line 6
    mul-long/2addr v0, v2

    .line 7
    const-wide/16 v2, 0x1e

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->realSkip(J)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->findEocdRecord()V

    .line 14
    .line 15
    .line 16
    const-wide/16 v0, 0x10

    .line 17
    .line 18
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->realSkip(J)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->shortBuf:[B

    .line 22
    .line 23
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->shortBuf:[B

    .line 27
    .line 28
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([B)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    int-to-long v0, v0

    .line 33
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->realSkip(J)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private supportsCompressedSizeFor(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    cmp-long v0, v0, v2

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
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->ENHANCED_DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 24
    .line 25
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eq v0, v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->usesDataDescriptor()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->allowStoredEntriesWithDataDescriptor:Z

    .line 42
    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 55
    return p0
.end method

.method private supportsDataDescriptorFor(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->usesDataDescriptor()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->allowStoredEntriesWithDataDescriptor:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/16 v0, 0x8

    .line 26
    .line 27
    if-eq p0, v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->ENHANCED_DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 34
    .line 35
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-ne p0, p1, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method


# virtual methods
.method public canReadEntryData(Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 7
    .line 8
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->canHandleEntryData(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->supportsDataDescriptorFor(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->supportsCompressedSizeFor(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v1
.end method

.method public close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/zip/Inflater;->end()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/zip/Inflater;->end()V

    .line 23
    .line 24
    .line 25
    throw v0

    .line 26
    :cond_0
    return-void
.end method

.method public getCompressedCount()J
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

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
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->a(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    return-wide v0

    .line 20
    :cond_0
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/16 v1, 0x8

    .line 29
    .line 30
    if-ne v0, v1, :cond_1

    .line 31
    .line 32
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->getBytesInflated()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    return-wide v0

    .line 37
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 38
    .line 39
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->UNSHRINKING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 48
    .line 49
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 54
    .line 55
    if-ne v0, v1, :cond_2

    .line 56
    .line 57
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->f(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Ljava/io/InputStream;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;

    .line 62
    .line 63
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->getCompressedCount()J

    .line 64
    .line 65
    .line 66
    move-result-wide v0

    .line 67
    return-wide v0

    .line 68
    :cond_2
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->IMPLODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 77
    .line 78
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 83
    .line 84
    if-ne v0, v1, :cond_3

    .line 85
    .line 86
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->f(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Ljava/io/InputStream;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;

    .line 91
    .line 92
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->getCompressedCount()J

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    return-wide v0

    .line 97
    :cond_3
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->ENHANCED_DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 106
    .line 107
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 112
    .line 113
    if-ne v0, v1, :cond_4

    .line 114
    .line 115
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->f(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Ljava/io/InputStream;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    check-cast p0, Ll/ijg0;

    .line 120
    .line 121
    iget-wide v0, p0, Ll/ijg0;->c:J

    .line 122
    .line 123
    return-wide v0

    .line 124
    :cond_4
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->BZIP2:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 133
    .line 134
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-ne v0, v1, :cond_5

    .line 139
    .line 140
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 141
    .line 142
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->f(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Ljava/io/InputStream;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    check-cast p0, Ll/tqg0;

    .line 147
    .line 148
    iget-object p0, p0, Ll/tqg0;->g:Ll/drg0;

    .line 149
    .line 150
    invoke-virtual {p0}, Ll/drg0;->getBytesRead()J

    .line 151
    .line 152
    .line 153
    move-result-wide v0

    .line 154
    return-wide v0

    .line 155
    :cond_5
    const-wide/16 v0, -0x1

    .line 156
    .line 157
    return-wide v0
.end method

.method public getNextEntry()Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->getNextZipEntry()Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getNextZipEntry()Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;
    .locals 12

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->uncompressedCount:J

    .line 4
    .line 5
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_10

    .line 9
    .line 10
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->hitCentralDirectory:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_6

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->closeEntry()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v2

    .line 27
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->getBytesRead()J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    :try_start_0
    invoke-direct {p0, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFirstLocalFileHeader([B)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    invoke-direct {p0, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([B)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    :goto_1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 43
    .line 44
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 45
    .line 46
    invoke-direct {v0, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([B)V

    .line 47
    .line 48
    .line 49
    sget-object v5, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 50
    .line 51
    invoke-virtual {v0, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-nez v5, :cond_5

    .line 56
    .line 57
    sget-object v3, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-nez v3, :cond_4

    .line 64
    .line 65
    sget-object v3, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->AED_SIG:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 66
    .line 67
    invoke-virtual {v0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-nez v3, :cond_4

    .line 72
    .line 73
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 74
    .line 75
    invoke-direct {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->isApkSigningBlock([B)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_3

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_3
    new-instance p0, Ljava/util/zip/ZipException;

    .line 83
    .line 84
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue()J

    .line 85
    .line 86
    .line 87
    move-result-wide v0

    .line 88
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const-string v1, "Unexpected record signature: 0X%X"

    .line 97
    .line 98
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-direct {p0, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    throw p0

    .line 106
    :cond_4
    :goto_2
    iput-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->hitCentralDirectory:Z

    .line 107
    .line 108
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->skipRemainderOfArchive()V

    .line 109
    .line 110
    .line 111
    return-object v1

    .line 112
    :cond_5
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 113
    .line 114
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;-><init>(Ll/mpq0;)V

    .line 115
    .line 116
    .line 117
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 118
    .line 119
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 120
    .line 121
    const/4 v5, 0x4

    .line 122
    invoke-static {v0, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 127
    .line 128
    invoke-static {v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 129
    .line 130
    .line 131
    move-result-object v6

    .line 132
    const/16 v7, 0x8

    .line 133
    .line 134
    shr-int/2addr v0, v7

    .line 135
    and-int/lit8 v0, v0, 0xf

    .line 136
    .line 137
    invoke-virtual {v6, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setPlatform(I)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 141
    .line 142
    const/4 v6, 0x6

    .line 143
    invoke-static {v0, v6}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->parse([BI)Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->usesUTF8ForNames()Z

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    if-eqz v6, :cond_6

    .line 152
    .line 153
    sget-object v8, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_6
    iget-object v8, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->zipEncoding:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 157
    .line 158
    :goto_3
    iget-object v9, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 159
    .line 160
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->usesDataDescriptor()Z

    .line 161
    .line 162
    .line 163
    move-result v10

    .line 164
    invoke-static {v9, v10}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->j(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Z)V

    .line 165
    .line 166
    .line 167
    iget-object v9, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 168
    .line 169
    invoke-static {v9}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 170
    .line 171
    .line 172
    move-result-object v9

    .line 173
    invoke-virtual {v9, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setGeneralPurposeBit(Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 177
    .line 178
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iget-object v9, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 183
    .line 184
    invoke-static {v9, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 185
    .line 186
    .line 187
    move-result v7

    .line 188
    invoke-virtual {v0, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setMethod(I)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 192
    .line 193
    const/16 v7, 0xa

    .line 194
    .line 195
    invoke-static {v0, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 196
    .line 197
    .line 198
    move-result-wide v9

    .line 199
    invoke-static {v9, v10}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->dosToJavaTime(J)J

    .line 200
    .line 201
    .line 202
    move-result-wide v9

    .line 203
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 204
    .line 205
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v0, v9, v10}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 210
    .line 211
    .line 212
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 213
    .line 214
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->e(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    .line 215
    .line 216
    .line 217
    move-result v7

    .line 218
    if-nez v7, :cond_7

    .line 219
    .line 220
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    iget-object v7, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 225
    .line 226
    const/16 v9, 0xe

    .line 227
    .line 228
    invoke-static {v7, v9}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 229
    .line 230
    .line 231
    move-result-wide v9

    .line 232
    invoke-virtual {v0, v9, v10}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 233
    .line 234
    .line 235
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 236
    .line 237
    iget-object v7, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 238
    .line 239
    const/16 v9, 0x12

    .line 240
    .line 241
    invoke-direct {v0, v7, v9}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([BI)V

    .line 242
    .line 243
    .line 244
    new-instance v7, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 245
    .line 246
    iget-object v9, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 247
    .line 248
    const/16 v10, 0x16

    .line 249
    .line 250
    invoke-direct {v7, v9, v10}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([BI)V

    .line 251
    .line 252
    .line 253
    goto :goto_4

    .line 254
    :cond_7
    move-object v0, v1

    .line 255
    move-object v7, v0

    .line 256
    :goto_4
    iget-object v9, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 257
    .line 258
    const/16 v10, 0x1a

    .line 259
    .line 260
    invoke-static {v9, v10}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 261
    .line 262
    .line 263
    move-result v9

    .line 264
    iget-object v10, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->lfhBuf:[B

    .line 265
    .line 266
    const/16 v11, 0x1c

    .line 267
    .line 268
    invoke-static {v10, v11}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 269
    .line 270
    .line 271
    move-result v10

    .line 272
    new-array v9, v9, [B

    .line 273
    .line 274
    invoke-direct {p0, v9}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 275
    .line 276
    .line 277
    iget-object v11, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 278
    .line 279
    invoke-static {v11}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 280
    .line 281
    .line 282
    move-result-object v11

    .line 283
    invoke-interface {v8, v9}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v8

    .line 287
    invoke-virtual {v11, v8, v9}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;[B)V

    .line 288
    .line 289
    .line 290
    if-eqz v6, :cond_8

    .line 291
    .line 292
    iget-object v8, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 293
    .line 294
    invoke-static {v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 295
    .line 296
    .line 297
    move-result-object v8

    .line 298
    sget-object v11, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;->NAME_WITH_EFS_FLAG:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;

    .line 299
    .line 300
    invoke-virtual {v8, v11}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setNameSource(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;)V

    .line 301
    .line 302
    .line 303
    :cond_8
    new-array v8, v10, [B

    .line 304
    .line 305
    invoke-direct {p0, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 306
    .line 307
    .line 308
    iget-object v10, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 309
    .line 310
    invoke-static {v10}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 311
    .line 312
    .line 313
    move-result-object v10

    .line 314
    invoke-virtual {v10, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra([B)V

    .line 315
    .line 316
    .line 317
    if-nez v6, :cond_9

    .line 318
    .line 319
    iget-boolean v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->useUnicodeExtraFields:Z

    .line 320
    .line 321
    if-eqz v6, :cond_9

    .line 322
    .line 323
    iget-object v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 324
    .line 325
    invoke-static {v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 326
    .line 327
    .line 328
    move-result-object v6

    .line 329
    invoke-static {v6, v9, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->setNameAndCommentFromExtraFields(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;[B[B)V

    .line 330
    .line 331
    .line 332
    :cond_9
    invoke-direct {p0, v7, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->processZip64Extra(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V

    .line 333
    .line 334
    .line 335
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 336
    .line 337
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-virtual {v0, v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setLocalHeaderOffset(J)V

    .line 342
    .line 343
    .line 344
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 345
    .line 346
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/ArchiveInputStream;->getBytesRead()J

    .line 351
    .line 352
    .line 353
    move-result-wide v3

    .line 354
    invoke-virtual {v0, v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setDataOffset(J)V

    .line 355
    .line 356
    .line 357
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 358
    .line 359
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    invoke-virtual {v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setStreamContiguous(Z)V

    .line 364
    .line 365
    .line 366
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 367
    .line 368
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getMethodByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 381
    .line 382
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 387
    .line 388
    .line 389
    move-result-wide v3

    .line 390
    const-wide/16 v6, -0x1

    .line 391
    .line 392
    cmp-long v1, v3, v6

    .line 393
    .line 394
    if-eqz v1, :cond_e

    .line 395
    .line 396
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 397
    .line 398
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->canHandleEntryData(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 403
    .line 404
    .line 405
    move-result v1

    .line 406
    if-eqz v1, :cond_f

    .line 407
    .line 408
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->STORED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 409
    .line 410
    if-eq v0, v1, :cond_f

    .line 411
    .line 412
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 413
    .line 414
    if-eq v0, v1, :cond_f

    .line 415
    .line 416
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;

    .line 417
    .line 418
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 419
    .line 420
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 421
    .line 422
    invoke-static {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 423
    .line 424
    .line 425
    move-result-object v4

    .line 426
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 427
    .line 428
    .line 429
    move-result-wide v6

    .line 430
    invoke-direct {v1, p0, v3, v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;Ljava/io/InputStream;J)V

    .line 431
    .line 432
    .line 433
    sget-object v3, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$1;->$SwitchMap$org$apache$commons$sudcompress$archivers$zip$ZipMethod:[I

    .line 434
    .line 435
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 436
    .line 437
    .line 438
    move-result v0

    .line 439
    aget v0, v3, v0

    .line 440
    .line 441
    if-eq v0, v2, :cond_d

    .line 442
    .line 443
    const/4 v3, 0x2

    .line 444
    if-eq v0, v3, :cond_c

    .line 445
    .line 446
    const/4 v3, 0x3

    .line 447
    if-eq v0, v3, :cond_b

    .line 448
    .line 449
    if-eq v0, v5, :cond_a

    .line 450
    .line 451
    goto :goto_5

    .line 452
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 453
    .line 454
    new-instance v3, Ll/ijg0;

    .line 455
    .line 456
    invoke-direct {v3, v1}, Ll/ijg0;-><init>(Ljava/io/InputStream;)V

    .line 457
    .line 458
    .line 459
    invoke-static {v0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->k(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Ljava/io/InputStream;)V

    .line 460
    .line 461
    .line 462
    goto :goto_5

    .line 463
    :cond_b
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 464
    .line 465
    new-instance v3, Ll/tqg0;

    .line 466
    .line 467
    invoke-direct {v3, v1}, Ll/tqg0;-><init>(Ljava/io/InputStream;)V

    .line 468
    .line 469
    .line 470
    invoke-static {v0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->k(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Ljava/io/InputStream;)V

    .line 471
    .line 472
    .line 473
    goto :goto_5

    .line 474
    :cond_c
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 475
    .line 476
    new-instance v3, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;

    .line 477
    .line 478
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 479
    .line 480
    .line 481
    move-result-object v4

    .line 482
    invoke-virtual {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 483
    .line 484
    .line 485
    move-result-object v4

    .line 486
    invoke-virtual {v4}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->getSlidingDictionarySize()I

    .line 487
    .line 488
    .line 489
    move-result v4

    .line 490
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 491
    .line 492
    invoke-static {v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 493
    .line 494
    .line 495
    move-result-object v5

    .line 496
    invoke-virtual {v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 497
    .line 498
    .line 499
    move-result-object v5

    .line 500
    invoke-virtual {v5}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->getNumberOfShannonFanoTrees()I

    .line 501
    .line 502
    .line 503
    move-result v5

    .line 504
    invoke-direct {v3, v4, v5, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;-><init>(IILjava/io/InputStream;)V

    .line 505
    .line 506
    .line 507
    invoke-static {v0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->k(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Ljava/io/InputStream;)V

    .line 508
    .line 509
    .line 510
    goto :goto_5

    .line 511
    :cond_d
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 512
    .line 513
    new-instance v3, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;

    .line 514
    .line 515
    invoke-direct {v3, v1}, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;-><init>(Ljava/io/InputStream;)V

    .line 516
    .line 517
    .line 518
    invoke-static {v0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->k(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Ljava/io/InputStream;)V

    .line 519
    .line 520
    .line 521
    goto :goto_5

    .line 522
    :cond_e
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->ENHANCED_DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 523
    .line 524
    if-ne v0, v1, :cond_f

    .line 525
    .line 526
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 527
    .line 528
    new-instance v1, Ll/ijg0;

    .line 529
    .line 530
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 531
    .line 532
    invoke-direct {v1, v3}, Ll/ijg0;-><init>(Ljava/io/InputStream;)V

    .line 533
    .line 534
    .line 535
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->k(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Ljava/io/InputStream;)V

    .line 536
    .line 537
    .line 538
    :cond_f
    :goto_5
    iget v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->entriesRead:I

    .line 539
    .line 540
    add-int/2addr v0, v2

    .line 541
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->entriesRead:I

    .line 542
    .line 543
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 544
    .line 545
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 546
    .line 547
    .line 548
    move-result-object p0

    .line 549
    return-object p0

    .line 550
    :catch_0
    :cond_10
    :goto_6
    return-object v1
.end method

.method public getUncompressedCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->uncompressedCount:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public read([BII)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 6
    .line 7
    if-nez v1, :cond_a

    .line 8
    .line 9
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const/4 p0, -0x1

    .line 14
    return p0

    .line 15
    :cond_1
    array-length v1, p1

    .line 16
    if-gt p2, v1, :cond_9

    .line 17
    .line 18
    if-ltz p3, :cond_9

    .line 19
    .line 20
    if-ltz p2, :cond_9

    .line 21
    .line 22
    array-length v1, p1

    .line 23
    sub-int/2addr v1, p2

    .line 24
    if-lt v1, p3, :cond_9

    .line 25
    .line 26
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->checkRequestedFeatures(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 34
    .line 35
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->supportsDataDescriptorFor(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_8

    .line 44
    .line 45
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 46
    .line 47
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->supportsCompressedSizeFor(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_7

    .line 56
    .line 57
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 58
    .line 59
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readStored([BII)I

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    goto/16 :goto_1

    .line 74
    .line 75
    :cond_2
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 76
    .line 77
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    const/16 v1, 0x8

    .line 86
    .line 87
    if-ne v0, v1, :cond_3

    .line 88
    .line 89
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->readDeflated([BII)I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    goto :goto_1

    .line 94
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 95
    .line 96
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->UNSHRINKING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 105
    .line 106
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eq v0, v1, :cond_5

    .line 111
    .line 112
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 113
    .line 114
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->IMPLODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 123
    .line 124
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-eq v0, v1, :cond_5

    .line 129
    .line 130
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 131
    .line 132
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->ENHANCED_DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 141
    .line 142
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-eq v0, v1, :cond_5

    .line 147
    .line 148
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 149
    .line 150
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->BZIP2:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 159
    .line 160
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-ne v0, v1, :cond_4

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_4
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;

    .line 168
    .line 169
    iget-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 170
    .line 171
    invoke-static {p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    invoke-virtual {p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    invoke-static {p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getMethodByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 184
    .line 185
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-direct {p1, p2, p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 190
    .line 191
    .line 192
    throw p1

    .line 193
    :cond_5
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 194
    .line 195
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->f(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Ljava/io/InputStream;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    .line 200
    .line 201
    .line 202
    move-result p3

    .line 203
    :goto_1
    if-ltz p3, :cond_6

    .line 204
    .line 205
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 206
    .line 207
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->c(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Ljava/util/zip/CRC32;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    .line 212
    .line 213
    .line 214
    iget-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->uncompressedCount:J

    .line 215
    .line 216
    int-to-long v0, p3

    .line 217
    add-long/2addr p1, v0

    .line 218
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->uncompressedCount:J

    .line 219
    .line 220
    :cond_6
    return p3

    .line 221
    :cond_7
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;

    .line 222
    .line 223
    sget-object p2, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->UNKNOWN_COMPRESSED_SIZE:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 224
    .line 225
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 226
    .line 227
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-direct {p1, p2, p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 232
    .line 233
    .line 234
    throw p1

    .line 235
    :cond_8
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;

    .line 236
    .line 237
    sget-object p2, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->DATA_DESCRIPTOR:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 238
    .line 239
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 240
    .line 241
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->d(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    invoke-direct {p1, p2, p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 246
    .line 247
    .line 248
    throw p1

    .line 249
    :cond_9
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 250
    .line 251
    invoke-direct {p0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    .line 252
    .line 253
    .line 254
    throw p0

    .line 255
    :cond_a
    const-string p0, "The stream is closed"

    .line 256
    .line 257
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    return v0
.end method

.method public skip(J)J
    .locals 7

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-ltz v2, :cond_3

    .line 6
    .line 7
    :goto_0
    cmp-long v2, v0, p1

    .line 8
    .line 9
    if-gez v2, :cond_2

    .line 10
    .line 11
    sub-long v2, p1, v0

    .line 12
    .line 13
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->skipBuf:[B

    .line 14
    .line 15
    array-length v5, v4

    .line 16
    int-to-long v5, v5

    .line 17
    cmp-long v5, v5, v2

    .line 18
    .line 19
    if-lez v5, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    array-length v2, v4

    .line 23
    int-to-long v2, v2

    .line 24
    :goto_1
    long-to-int v2, v2

    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-virtual {p0, v4, v3, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->read([BII)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, -0x1

    .line 31
    if-ne v2, v3, :cond_1

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_1
    int-to-long v2, v2

    .line 35
    add-long/2addr v0, v2

    .line 36
    goto :goto_0

    .line 37
    :cond_2
    :goto_2
    return-wide v0

    .line 38
    :cond_3
    invoke-static {}, Ll/fig0;->a()V

    .line 39
    .line 40
    .line 41
    return-wide v0
.end method
