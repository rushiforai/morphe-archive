.class public final Lcom/google/common/io/Files;
.super Ljava/lang/Object;
.source "Files.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/io/Files$FileByteSource;,
        Lcom/google/common/io/Files$FileByteSink;,
        Lcom/google/common/io/Files$FilePredicate;
    }
.end annotation


# static fields
.field private static final FILE_TREE:Lcom/google/common/graph/SuccessorsFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/graph/SuccessorsFunction<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 847
    new-instance v0, Lcom/google/common/io/Files$0;

    invoke-direct {v0}, Lcom/google/common/io/Files$0;-><init>()V

    sput-object v0, Lcom/google/common/io/Files;->FILE_TREE:Lcom/google/common/graph/SuccessorsFunction;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static append(Ljava/lang/CharSequence;Ljava/io/File;Ljava/nio/charset/Charset;)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "from",
            "to",
            "charset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    .line 363
    new-array v0, v0, [Lcom/google/common/io/FileWriteMode;

    const/4 v1, 0x0

    sget-object v2, Lcom/google/common/io/FileWriteMode;->APPEND:Lcom/google/common/io/FileWriteMode;

    aput-object v2, v0, v1

    invoke-static {p1, p2, v0}, Lcom/google/common/io/Files;->asCharSink(Ljava/io/File;Ljava/nio/charset/Charset;[Lcom/google/common/io/FileWriteMode;)Lcom/google/common/io/CharSink;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/google/common/io/CharSink;->write(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static varargs asByteSink(Ljava/io/File;[Lcom/google/common/io/FileWriteMode;)Lcom/google/common/io/ByteSink;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "modes"
        }
    .end annotation

    .line 179
    new-instance v0, Lcom/google/common/io/Files$FileByteSink;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/google/common/io/Files$FileByteSink;-><init>(Ljava/io/File;[Lcom/google/common/io/FileWriteMode;Lcom/google/common/io/Files$1;)V

    return-object v0
.end method

.method public static asByteSource(Ljava/io/File;)Lcom/google/common/io/ByteSource;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .line 116
    new-instance v0, Lcom/google/common/io/Files$FileByteSource;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/io/Files$FileByteSource;-><init>(Ljava/io/File;Lcom/google/common/io/Files$1;)V

    return-object v0
.end method

.method public static varargs asCharSink(Ljava/io/File;Ljava/nio/charset/Charset;[Lcom/google/common/io/FileWriteMode;)Lcom/google/common/io/CharSink;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "file",
            "charset",
            "modes"
        }
    .end annotation

    .line 222
    invoke-static {p0, p2}, Lcom/google/common/io/Files;->asByteSink(Ljava/io/File;[Lcom/google/common/io/FileWriteMode;)Lcom/google/common/io/ByteSink;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/google/common/io/ByteSink;->asCharSink(Ljava/nio/charset/Charset;)Lcom/google/common/io/CharSink;

    move-result-object p0

    return-object p0
.end method

.method public static asCharSource(Ljava/io/File;Ljava/nio/charset/Charset;)Lcom/google/common/io/CharSource;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "charset"
        }
    .end annotation

    .line 210
    invoke-static {p0}, Lcom/google/common/io/Files;->asByteSource(Ljava/io/File;)Lcom/google/common/io/ByteSource;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/google/common/io/ByteSource;->asCharSource(Ljava/nio/charset/Charset;)Lcom/google/common/io/CharSource;

    move-result-object p0

    return-object p0
.end method

.method public static copy(Ljava/io/File;Ljava/io/File;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "from",
            "to"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 324
    invoke-virtual {p0, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Source %s and destination %s must be different"

    invoke-static {v0, v1, p0, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 325
    invoke-static {p0}, Lcom/google/common/io/Files;->asByteSource(Ljava/io/File;)Lcom/google/common/io/ByteSource;

    move-result-object p0

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/common/io/FileWriteMode;

    invoke-static {p1, v0}, Lcom/google/common/io/Files;->asByteSink(Ljava/io/File;[Lcom/google/common/io/FileWriteMode;)Lcom/google/common/io/ByteSink;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/io/ByteSource;->copyTo(Lcom/google/common/io/ByteSink;)J

    return-void
.end method

.method public static copy(Ljava/io/File;Ljava/io/OutputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "from",
            "to"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 301
    invoke-static {p0}, Lcom/google/common/io/Files;->asByteSource(Ljava/io/File;)Lcom/google/common/io/ByteSource;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/google/common/io/ByteSource;->copyTo(Ljava/io/OutputStream;)J

    return-void
.end method

.method public static copy(Ljava/io/File;Ljava/nio/charset/Charset;Ljava/lang/Appendable;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "from",
            "charset",
            "to"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 344
    invoke-static {p0, p1}, Lcom/google/common/io/Files;->asCharSource(Ljava/io/File;Ljava/nio/charset/Charset;)Lcom/google/common/io/CharSource;

    move-result-object p0

    invoke-virtual {p0, p2}, Lcom/google/common/io/CharSource;->copyTo(Ljava/lang/Appendable;)J

    return-void
.end method

.method public static createParentDirs(Ljava/io/File;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 464
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 475
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 476
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    return-void

    .line 477
    :cond_1
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to create parent directories of "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static createTempDir()Ljava/io/File;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 436
    sget-object v0, Lcom/google/common/io/TempFileCreator;->INSTANCE:Lcom/google/common/io/TempFileCreator;

    invoke-virtual {v0}, Lcom/google/common/io/TempFileCreator;->createTempDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static equal(Ljava/io/File;Ljava/io/File;)Z
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file1",
            "file2"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 374
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eq p0, p1, :cond_1

    .line 376
    invoke-virtual {p0, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 385
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    .line 386
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-eqz v6, :cond_0

    cmp-long v4, v2, v4

    if-eqz v4, :cond_0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 390
    :cond_0
    invoke-static {p0}, Lcom/google/common/io/Files;->asByteSource(Ljava/io/File;)Lcom/google/common/io/ByteSource;

    move-result-object p0

    invoke-static {p1}, Lcom/google/common/io/Files;->asByteSource(Ljava/io/File;)Lcom/google/common/io/ByteSource;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/io/ByteSource;->contentEquals(Lcom/google/common/io/ByteSource;)Z

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static fileTraverser()Lcom/google/common/graph/Traverser;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/Traverser<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 844
    sget-object v0, Lcom/google/common/io/Files;->FILE_TREE:Lcom/google/common/graph/SuccessorsFunction;

    invoke-static {v0}, Lcom/google/common/graph/Traverser;->forTree(Lcom/google/common/graph/SuccessorsFunction;)Lcom/google/common/graph/Traverser;

    move-result-object v0

    return-object v0
.end method

.method public static getFileExtension(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fullName"
        }
    .end annotation

    .line 798
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 799
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x2e

    .line 800
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 801
    const-string p0, ""

    return-object p0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getNameWithoutExtension(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .line 815
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 816
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x2e

    .line 817
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-object p0

    :cond_0
    const/4 v1, 0x0

    .line 818
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static hash(Ljava/io/File;Lcom/google/common/hash/HashFunction;)Lcom/google/common/hash/HashCode;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "hashFunction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 629
    invoke-static {p0}, Lcom/google/common/io/Files;->asByteSource(Ljava/io/File;)Lcom/google/common/io/ByteSource;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/google/common/io/ByteSource;->hash(Lcom/google/common/hash/HashFunction;)Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public static isDirectory()Lcom/google/common/base/Predicate;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Predicate<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 866
    sget-object v0, Lcom/google/common/io/Files$FilePredicate;->IS_DIRECTORY:Lcom/google/common/io/Files$FilePredicate;

    return-object v0
.end method

.method public static isFile()Lcom/google/common/base/Predicate;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Predicate<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 875
    sget-object v0, Lcom/google/common/io/Files$FilePredicate;->IS_FILE:Lcom/google/common/io/Files$FilePredicate;

    return-object v0
.end method

.method static synthetic lambda$static$0(Ljava/io/File;)Ljava/lang/Iterable;
    .registers 2

    .line 850
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 851
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 853
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 857
    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method public static map(Ljava/io/File;)Ljava/nio/MappedByteBuffer;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 648
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 649
    sget-object v0, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    invoke-static {p0, v0}, Lcom/google/common/io/Files;->map(Ljava/io/File;Ljava/nio/channels/FileChannel$MapMode;)Ljava/nio/MappedByteBuffer;

    move-result-object p0

    return-object p0
.end method

.method public static map(Ljava/io/File;Ljava/nio/channels/FileChannel$MapMode;)Ljava/nio/MappedByteBuffer;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "mode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, -0x1

    .line 670
    invoke-static {p0, p1, v0, v1}, Lcom/google/common/io/Files;->mapInternal(Ljava/io/File;Ljava/nio/channels/FileChannel$MapMode;J)Ljava/nio/MappedByteBuffer;

    move-result-object p0

    return-object p0
.end method

.method public static map(Ljava/io/File;Ljava/nio/channels/FileChannel$MapMode;J)Ljava/nio/MappedByteBuffer;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "file",
            "mode",
            "size"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 693
    :goto_0
    const-string v1, "size (%s) may not be negative"

    invoke-static {v0, v1, p2, p3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 694
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/io/Files;->mapInternal(Ljava/io/File;Ljava/nio/channels/FileChannel$MapMode;J)Ljava/nio/MappedByteBuffer;

    move-result-object p0

    return-object p0
.end method

.method private static mapInternal(Ljava/io/File;Ljava/nio/channels/FileChannel$MapMode;J)Ljava/nio/MappedByteBuffer;
    .registers 12
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "file",
            "mode",
            "size"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 699
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    invoke-static {}, Lcom/google/common/io/Closer;->create()Lcom/google/common/io/Closer;

    move-result-object v1

    .line 704
    :try_start_0
    new-instance v0, Ljava/io/RandomAccessFile;

    .line 705
    sget-object v2, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    if-ne p1, v2, :cond_0

    const-string v2, "r"

    goto :goto_0

    :cond_0
    const-string v2, "rw"

    :goto_0
    invoke-direct {v0, p0, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/google/common/io/Closer;->register(Ljava/io/Closeable;)Ljava/io/Closeable;

    move-result-object p0

    check-cast p0, Ljava/io/RandomAccessFile;

    .line 706
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/google/common/io/Closer;->register(Ljava/io/Closeable;)Ljava/io/Closeable;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Ljava/nio/channels/FileChannel;

    const-wide/16 v3, -0x1

    cmp-long p0, p2, v3

    if-nez p0, :cond_1

    .line 707
    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide p2

    :cond_1
    move-wide v6, p2

    const-wide/16 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 711
    invoke-virtual {v1}, Lcom/google/common/io/Closer;->close()V

    return-object p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    .line 709
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/common/io/Closer;->rethrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v0

    move-object p0, v0

    .line 711
    invoke-virtual {v1}, Lcom/google/common/io/Closer;->close()V

    .line 712
    throw p0
.end method

.method public static move(Ljava/io/File;Ljava/io/File;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "from",
            "to"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 494
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    invoke-virtual {p0, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Source %s and destination %s must be different"

    invoke-static {v0, v1, p0, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 498
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 499
    invoke-static {p0, p1}, Lcom/google/common/io/Files;->copy(Ljava/io/File;Ljava/io/File;)V

    .line 500
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_1

    .line 501
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    const-string v1, "Unable to delete "

    if-nez v0, :cond_0

    .line 502
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 504
    :cond_0
    new-instance p1, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    return-void
.end method

.method public static newReader(Ljava/io/File;Ljava/nio/charset/Charset;)Ljava/io/BufferedReader;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "charset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 87
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    return-object v0
.end method

.method public static newWriter(Ljava/io/File;Ljava/nio/charset/Charset;)Ljava/io/BufferedWriter;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "charset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 105
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v1, Ljava/io/OutputStreamWriter;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    return-object v0
.end method

.method public static readBytes(Ljava/io/File;Lcom/google/common/io/ByteProcessor;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "processor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/File;",
            "Lcom/google/common/io/ByteProcessor<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 610
    invoke-static {p0}, Lcom/google/common/io/Files;->asByteSource(Ljava/io/File;)Lcom/google/common/io/ByteSource;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/google/common/io/ByteSource;->read(Lcom/google/common/io/ByteProcessor;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static readFirstLine(Ljava/io/File;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "charset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 526
    invoke-static {p0, p1}, Lcom/google/common/io/Files;->asCharSource(Ljava/io/File;Ljava/nio/charset/Charset;)Lcom/google/common/io/CharSource;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/io/CharSource;->readFirstLine()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static readLines(Ljava/io/File;Ljava/nio/charset/Charset;Lcom/google/common/io/LineProcessor;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "file",
            "charset",
            "callback"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/File;",
            "Ljava/nio/charset/Charset;",
            "Lcom/google/common/io/LineProcessor<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 587
    invoke-static {p0, p1}, Lcom/google/common/io/Files;->asCharSource(Ljava/io/File;Ljava/nio/charset/Charset;)Lcom/google/common/io/CharSource;

    move-result-object p0

    invoke-virtual {p0, p2}, Lcom/google/common/io/CharSource;->readLines(Lcom/google/common/io/LineProcessor;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static readLines(Ljava/io/File;Ljava/nio/charset/Charset;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "charset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 548
    invoke-static {p0, p1}, Lcom/google/common/io/Files;->asCharSource(Ljava/io/File;Ljava/nio/charset/Charset;)Lcom/google/common/io/CharSource;

    move-result-object p0

    new-instance p1, Lcom/google/common/io/Files$1;

    invoke-direct {p1}, Lcom/google/common/io/Files$1;-><init>()V

    .line 549
    invoke-virtual {p0, p1}, Lcom/google/common/io/CharSource;->readLines(Lcom/google/common/io/LineProcessor;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public static simplifyPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "pathname"
        }
    .end annotation

    .line 736
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 737
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const-string v1, "."

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    const/16 v0, 0x2f

    .line 742
    invoke-static {v0}, Lcom/google/common/base/Splitter;->on(C)Lcom/google/common/base/Splitter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/base/Splitter;->omitEmptyStrings()Lcom/google/common/base/Splitter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/google/common/base/Splitter;->split(Ljava/lang/CharSequence;)Ljava/lang/Iterable;

    move-result-object v2

    .line 743
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 746
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 747
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, ".."

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 758
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 751
    :cond_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 752
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 754
    :cond_3
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 764
    :cond_4
    invoke-static {v0}, Lcom/google/common/base/Joiner;->on(C)Lcom/google/common/base/Joiner;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    .line 765
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const-string v3, "/"

    if-ne p0, v0, :cond_5

    .line 766
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 769
    :cond_5
    :goto_1
    const-string p0, "/../"

    invoke-virtual {v2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_6

    const/4 p0, 0x3

    .line 770
    invoke-virtual {v2, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 772
    :cond_6
    const-string p0, "/.."

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7

    return-object v3

    .line 774
    :cond_7
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_8

    return-object v1

    :cond_8
    return-object v2
.end method

.method public static toByteArray(Ljava/io/File;)[B
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 237
    invoke-static {p0}, Lcom/google/common/io/Files;->asByteSource(Ljava/io/File;)Lcom/google/common/io/ByteSource;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/io/ByteSource;->read()[B

    move-result-object p0

    return-object p0
.end method

.method public static toString(Ljava/io/File;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "charset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 255
    invoke-static {p0, p1}, Lcom/google/common/io/Files;->asCharSource(Ljava/io/File;Ljava/nio/charset/Charset;)Lcom/google/common/io/CharSource;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/io/CharSource;->read()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static touch(Ljava/io/File;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 448
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljava/io/File;->setLastModified(J)Z

    move-result v0

    if-nez v0, :cond_0

    .line 450
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to update modification time of "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method public static write(Ljava/lang/CharSequence;Ljava/io/File;Ljava/nio/charset/Charset;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "from",
            "to",
            "charset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 287
    new-array v0, v0, [Lcom/google/common/io/FileWriteMode;

    invoke-static {p1, p2, v0}, Lcom/google/common/io/Files;->asCharSink(Ljava/io/File;Ljava/nio/charset/Charset;[Lcom/google/common/io/FileWriteMode;)Lcom/google/common/io/CharSink;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/google/common/io/CharSink;->write(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static write([BLjava/io/File;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "from",
            "to"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 269
    new-array v0, v0, [Lcom/google/common/io/FileWriteMode;

    invoke-static {p1, v0}, Lcom/google/common/io/Files;->asByteSink(Ljava/io/File;[Lcom/google/common/io/FileWriteMode;)Lcom/google/common/io/ByteSink;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/google/common/io/ByteSink;->write([B)V

    return-void
.end method
