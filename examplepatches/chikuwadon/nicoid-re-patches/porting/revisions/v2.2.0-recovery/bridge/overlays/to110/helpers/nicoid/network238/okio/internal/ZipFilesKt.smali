.class public final Lnicoid/network238/okio/internal/ZipFilesKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000d\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010$\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u001a.\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0014\u0008\u0002\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00180\u0016H\u0000\u001a\"\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00170\u001a2\u000c\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u001cH\u0002\u001a\u000c\u0010\u001d\u001a\u00020\u0017*\u00020\u001eH\u0000\u001a\u000c\u0010\u001f\u001a\u00020 *\u00020\u001eH\u0002\u001a\u0014\u0010!\u001a\u00020 *\u00020\u001e2\u0006\u0010\"\u001a\u00020 H\u0002\u001a.\u0010#\u001a\u00020$*\u00020\u001e2\u0006\u0010%\u001a\u00020\u00012\u0018\u0010&\u001a\u0014\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020$0\'H\u0002\u001a\u000c\u0010(\u001a\u00020$*\u00020\u001eH\u0000\u001a\u0014\u0010)\u001a\u00020\u0017*\u00020\u001e2\u0006\u0010*\u001a\u00020\u0017H\u0000\u001a\u0018\u0010+\u001a\u0004\u0018\u00010\u0017*\u00020\u001e2\u0008\u0010*\u001a\u0004\u0018\u00010\u0017H\u0002\u001a\u0010\u0010,\u001a\u00020\u000b2\u0006\u0010-\u001a\u00020\u000bH\u0000\u001a\u001f\u0010.\u001a\u0004\u0018\u00010\u000b2\u0006\u0010/\u001a\u00020\u00012\u0006\u00100\u001a\u00020\u0001H\u0000\u00a2\u0006\u0002\u00101\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0003\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0004\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0005\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0006\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0007\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0008\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\t\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\n\u001a\u00020\u000bX\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000c\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\r\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000e\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u0018\u00102\u001a\u000203*\u00020\u00018BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u00084\u00105\u00a8\u00066"
    }
    d2 = {
        "LOCAL_FILE_HEADER_SIGNATURE",
        "",
        "CENTRAL_FILE_HEADER_SIGNATURE",
        "END_OF_CENTRAL_DIRECTORY_SIGNATURE",
        "ZIP64_LOCATOR_SIGNATURE",
        "ZIP64_EOCD_RECORD_SIGNATURE",
        "COMPRESSION_METHOD_DEFLATED",
        "COMPRESSION_METHOD_STORED",
        "BIT_FLAG_ENCRYPTED",
        "BIT_FLAG_UNSUPPORTED_MASK",
        "MAX_ZIP_ENTRY_AND_ARCHIVE_SIZE",
        "",
        "HEADER_ID_ZIP64_EXTENDED_INFO",
        "HEADER_ID_NTFS_EXTRA",
        "HEADER_ID_EXTENDED_TIMESTAMP",
        "openZip",
        "Lnicoid/network238/okio/ZipFileSystem;",
        "zipPath",
        "Lnicoid/network238/okio/Path;",
        "fileSystem",
        "Lnicoid/network238/okio/FileSystem;",
        "predicate",
        "Lnicoid/network238/kotlin/Function1;",
        "Lnicoid/network238/okio/internal/ZipEntry;",
        "",
        "buildIndex",
        "",
        "entries",
        "",
        "readCentralDirectoryZipEntry",
        "Lnicoid/network238/okio/BufferedSource;",
        "readEocdRecord",
        "Lnicoid/network238/okio/internal/EocdRecord;",
        "readZip64EocdRecord",
        "regularRecord",
        "readExtra",
        "",
        "extraSize",
        "block",
        "Lnicoid/network238/kotlin/Function2;",
        "skipLocalHeader",
        "readLocalHeader",
        "centralDirectoryZipEntry",
        "readOrSkipLocalHeader",
        "filetimeToEpochMillis",
        "filetime",
        "dosDateTimeToEpochMillis",
        "date",
        "time",
        "(II)Ljava/lang/Long;",
        "hex",
        "",
        "getHex",
        "(I)Ljava/lang/String;",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final BIT_FLAG_ENCRYPTED:I = 0x1

.field private static final BIT_FLAG_UNSUPPORTED_MASK:I = 0x1

.field private static final CENTRAL_FILE_HEADER_SIGNATURE:I = 0x2014b50

.field public static final COMPRESSION_METHOD_DEFLATED:I = 0x8

.field public static final COMPRESSION_METHOD_STORED:I = 0x0

.field private static final END_OF_CENTRAL_DIRECTORY_SIGNATURE:I = 0x6054b50

.field private static final HEADER_ID_EXTENDED_TIMESTAMP:I = 0x5455

.field private static final HEADER_ID_NTFS_EXTRA:I = 0xa

.field private static final HEADER_ID_ZIP64_EXTENDED_INFO:I = 0x1

.field private static final LOCAL_FILE_HEADER_SIGNATURE:I = 0x4034b50

.field private static final MAX_ZIP_ENTRY_AND_ARCHIVE_SIZE:J = 0xffffffffL

.field private static final ZIP64_EOCD_RECORD_SIGNATURE:I = 0x6064b50

.field private static final ZIP64_LOCATOR_SIGNATURE:I = 0x7064b50


# direct methods
.method public static synthetic $r8$lambda$BY2EJxV3DltaiT8Wp4_9EammrI8(Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;IJ)Lnicoid/network238/kotlin/Unit;
    .registers 7

    invoke-static/range {p0 .. p6}, Lnicoid/network238/okio/internal/ZipFilesKt;->readCentralDirectoryZipEntry$lambda$1$0(Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;IJ)Lnicoid/network238/kotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method private static final buildIndex(Ljava/util/List;)Ljava/util/Map;
    .registers 29
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okio/internal/ZipEntry;",
            ">;)",
            "Ljava/util/Map<",
            "Lnicoid/network238/okio/Path;",
            "Lnicoid/network238/okio/internal/ZipEntry;",
            ">;"
        }
    .end annotation

    .line 149
    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    const/4 v1, 0x0

    const-string v2, "/"

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v0, v2, v3, v4, v1}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/lang/String;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object v6

    .line 151
    new-instance v5, Lnicoid/network238/okio/internal/ZipEntry;

    const v26, 0xfffc

    const/16 v27, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-direct/range {v5 .. v27}, Lnicoid/network238/okio/internal/ZipEntry;-><init>(Lnicoid/network238/okio/Path;ZLjava/lang/String;JJJIJIILjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {v6, v5}, Lnicoid/network238/kotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lnicoid/network238/kotlin/Pair;

    move-result-object v0

    new-array v1, v4, [Lnicoid/network238/kotlin/Pair;

    aput-object v0, v1, v3

    .line 150
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/MapsKt;->mutableMapOf([Lnicoid/network238/kotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    .line 588
    new-instance v1, Lnicoid/network238/okio/internal/ZipFilesKt$buildIndex$$inlined$sortedBy$1;

    invoke-direct {v1}, Lnicoid/network238/okio/internal/ZipFilesKt$buildIndex$$inlined$sortedBy$1;-><init>()V

    move-object/from16 v2, p0

    invoke-static {v2, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v1

    .line 155
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okio/internal/ZipEntry;

    .line 158
    invoke-virtual {v2}, Lnicoid/network238/okio/internal/ZipEntry;->getCanonicalPath()Lnicoid/network238/okio/Path;

    move-result-object v3

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okio/internal/ZipEntry;

    if-nez v3, :cond_0

    .line 164
    :goto_1
    invoke-virtual {v2}, Lnicoid/network238/okio/internal/ZipEntry;->getCanonicalPath()Lnicoid/network238/okio/Path;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okio/Path;->parent()Lnicoid/network238/okio/Path;

    move-result-object v5

    if-nez v5, :cond_1

    goto :goto_0

    .line 165
    :cond_1
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okio/internal/ZipEntry;

    if-eqz v3, :cond_2

    .line 169
    invoke-virtual {v3}, Lnicoid/network238/okio/internal/ZipEntry;->getChildren()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2}, Lnicoid/network238/okio/internal/ZipEntry;->getCanonicalPath()Lnicoid/network238/okio/Path;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 174
    :cond_2
    new-instance v4, Lnicoid/network238/okio/internal/ZipEntry;

    const v25, 0xfffc

    const/16 v26, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    const/4 v14, 0x0

    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-direct/range {v4 .. v26}, Lnicoid/network238/okio/internal/ZipEntry;-><init>(Lnicoid/network238/okio/Path;ZLjava/lang/String;JJJIJIILjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 178
    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    invoke-virtual {v4}, Lnicoid/network238/okio/internal/ZipEntry;->getChildren()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2}, Lnicoid/network238/okio/internal/ZipEntry;->getCanonicalPath()Lnicoid/network238/okio/Path;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object v2, v4

    goto :goto_1

    :cond_3
    return-object v0
.end method

.method public static final dosDateTimeToEpochMillis(II)Ljava/lang/Long;
    .registers 9

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    shr-int/lit8 v0, p0, 0x9

    and-int/lit8 v0, v0, 0x7f

    add-int/lit16 v1, v0, 0x7bc

    shr-int/lit8 v0, p0, 0x5

    and-int/lit8 v2, v0, 0xf

    and-int/lit8 v3, p0, 0x1f

    shr-int/lit8 p0, p1, 0xb

    and-int/lit8 v4, p0, 0x1f

    shr-int/lit8 p0, p1, 0x5

    and-int/lit8 v5, p0, 0x3f

    and-int/lit8 p1, p1, 0x1f

    shl-int/lit8 v6, p1, 0x1

    .line 485
    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/internal/_ZlibJvmKt;->datePartsToEpochMillis(IIIIII)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static final filetimeToEpochMillis(J)J
    .registers 4

    .line 473
    const-wide/16 v0, 0x2710

    div-long/2addr p0, v0

    const-wide v0, 0xa9730b66800L

    sub-long/2addr p0, v0

    return-wide p0
.end method

.method private static final getHex(I)Ljava/lang/String;
    .registers 3

    .line 502
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "0x"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x10

    invoke-static {v1}, Lnicoid/network238/kotlin/text/CharsKt;->checkRadix(I)I

    move-result v1

    invoke-static {p0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final openZip(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okio/ZipFileSystem;
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Path;",
            "Lnicoid/network238/okio/FileSystem;",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")",
            "Lnicoid/network238/okio/ZipFileSystem;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "not a zip: size="

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    invoke-virtual {v2, v1}, Lnicoid/network238/okio/FileSystem;->openReadOnly(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileHandle;

    move-result-object v3

    .line 71
    :try_start_0
    invoke-virtual {v3}, Lnicoid/network238/okio/FileHandle;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x16

    sub-long v6, v4, v6

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-ltz v10, :cond_12

    const-wide/32 v10, 0x10016

    sub-long/2addr v4, v10

    .line 75
    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 80
    :goto_0
    invoke-virtual {v3, v6, v7}, Lnicoid/network238/okio/FileHandle;->source(J)Lnicoid/network238/okio/Source;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_c

    .line 82
    :try_start_1
    invoke-interface {v10}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    const v11, 0x6054b50

    if-ne v0, v11, :cond_10

    .line 84
    invoke-static {v10}, Lnicoid/network238/okio/internal/ZipFilesKt;->readEocdRecord(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okio/internal/EocdRecord;

    move-result-object v4

    .line 85
    invoke-virtual {v4}, Lnicoid/network238/okio/internal/EocdRecord;->getCommentByteCount()I

    move-result v0

    int-to-long v11, v0

    invoke-interface {v10, v11, v12}, Lnicoid/network238/okio/BufferedSource;->readUtf8(J)Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_b

    .line 89
    :try_start_2
    invoke-interface {v10}, Lnicoid/network238/okio/Source;->close()V

    const-wide/16 v10, 0x14

    sub-long/2addr v6, v10

    cmp-long v0, v6, v8

    const/4 v10, 0x0

    if-lez v0, :cond_9

    .line 101
    invoke-virtual {v3, v6, v7}, Lnicoid/network238/okio/FileHandle;->source(J)Lnicoid/network238/okio/Source;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_c

    .line 102
    :try_start_3
    invoke-interface {v6}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    const v7, 0x7064b50

    if-ne v0, v7, :cond_5

    .line 103
    invoke-interface {v6}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    .line 104
    invoke-interface {v6}, Lnicoid/network238/okio/BufferedSource;->readLongLe()J

    move-result-wide v11

    .line 105
    invoke-interface {v6}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v7

    const/4 v13, 0x1

    if-ne v7, v13, :cond_4

    if-nez v0, :cond_4

    .line 109
    invoke-virtual {v3, v11, v12}, Lnicoid/network238/okio/FileHandle;->source(J)Lnicoid/network238/okio/Source;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    .line 110
    :try_start_4
    invoke-interface {v7}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    const v11, 0x6064b50

    if-ne v0, v11, :cond_1

    .line 117
    invoke-static {v7, v4}, Lnicoid/network238/okio/internal/ZipFilesKt;->readZip64EocdRecord(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/internal/EocdRecord;)Lnicoid/network238/okio/internal/EocdRecord;

    move-result-object v4

    .line 118
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v7, :cond_0

    .line 521
    :try_start_5
    invoke-interface {v7}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_3

    .line 526
    :cond_0
    :goto_1
    move-object v0, v10

    goto :goto_3

    .line 112
    :cond_1
    :try_start_6
    new-instance v12, Ljava/io/IOException;

    .line 113
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "bad zip: expected "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v11}, Lnicoid/network238/okio/internal/ZipFilesKt;->getHex(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v13, " but was "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 114
    invoke-static {v0}, Lnicoid/network238/okio/internal/ZipFilesKt;->getHex(I)Ljava/lang/String;

    move-result-object v0

    .line 113
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 112
    invoke-direct {v12, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception v0

    move-object v11, v4

    move-object v4, v0

    if-eqz v7, :cond_2

    .line 521
    :try_start_7
    invoke-interface {v7}, Ljava/io/Closeable;->close()V

    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception v0

    .line 526
    :try_start_8
    invoke-static {v4, v0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_2

    .line 535
    :catchall_3
    move-exception v0

    goto :goto_6

    .line 526
    :cond_2
    :goto_2
    move-object v0, v4

    move-object v4, v11

    :goto_3
    if-nez v0, :cond_3

    goto :goto_4

    .line 531
    :cond_3
    :try_start_9
    throw v0

    .line 107
    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v7, "unsupported zip: spanned"

    invoke-direct {v0, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_5
    :goto_4
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    if-eqz v6, :cond_6

    .line 535
    :try_start_a
    invoke-interface {v6}, Ljava/io/Closeable;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    goto :goto_5

    :catchall_4
    move-exception v0

    goto :goto_8

    .line 540
    :cond_6
    :goto_5
    move-object v0, v10

    goto :goto_8

    .line 535
    :catchall_5
    move-exception v0

    move-object v11, v4

    :goto_6
    move-object v4, v0

    if-eqz v6, :cond_7

    :try_start_b
    invoke-interface {v6}, Ljava/io/Closeable;->close()V

    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    goto :goto_7

    :catchall_6
    move-exception v0

    .line 540
    :try_start_c
    invoke-static {v4, v0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_7
    :goto_7
    move-object v0, v4

    move-object v4, v11

    :goto_8
    if-nez v0, :cond_8

    goto :goto_9

    .line 547
    :cond_8
    throw v0

    .line 124
    :cond_9
    :goto_9
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 125
    invoke-virtual {v4}, Lnicoid/network238/okio/internal/EocdRecord;->getCentralDirectoryOffset()J

    move-result-wide v11

    invoke-virtual {v3, v11, v12}, Lnicoid/network238/okio/FileHandle;->source(J)Lnicoid/network238/okio/Source;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v7
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_c

    .line 126
    :try_start_d
    invoke-virtual {v4}, Lnicoid/network238/okio/internal/EocdRecord;->getEntryCount()J

    move-result-wide v11

    :goto_a
    cmp-long v0, v8, v11

    if-gez v0, :cond_c

    .line 127
    invoke-static {v7}, Lnicoid/network238/okio/internal/ZipFilesKt;->readCentralDirectoryZipEntry(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okio/internal/ZipEntry;

    move-result-object v0

    .line 128
    invoke-virtual {v0}, Lnicoid/network238/okio/internal/ZipEntry;->getOffset()J

    move-result-wide v13

    invoke-virtual {v4}, Lnicoid/network238/okio/internal/EocdRecord;->getCentralDirectoryOffset()J

    move-result-wide v15

    cmp-long v13, v13, v15

    if-gez v13, :cond_b

    .line 131
    move-object/from16 v13, p2

    invoke-interface {v13, v0}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Boolean;

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_a

    .line 132
    invoke-interface {v6, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_a
    const-wide/16 v14, 0x1

    add-long/2addr v8, v14

    goto :goto_a

    .line 129
    :cond_b
    new-instance v0, Ljava/io/IOException;

    const-string v4, "bad zip: local file header offset >= central directory offset"

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_c
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_8

    if-eqz v7, :cond_d

    .line 559
    :try_start_e
    invoke-interface {v7}, Ljava/io/Closeable;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_7

    goto :goto_b

    :catchall_7
    move-exception v0

    move-object v10, v0

    goto :goto_b

    :catchall_8
    move-exception v0

    move-object v10, v0

    if-eqz v7, :cond_d

    :try_start_f
    invoke-interface {v7}, Ljava/io/Closeable;->close()V

    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    goto :goto_b

    :catchall_9
    move-exception v0

    .line 564
    :try_start_10
    invoke-static {v10, v0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_d
    :goto_b
    if-nez v10, :cond_f

    .line 138
    invoke-static {v6}, Lnicoid/network238/okio/internal/ZipFilesKt;->buildIndex(Ljava/util/List;)Ljava/util/Map;

    move-result-object v0

    .line 140
    new-instance v4, Lnicoid/network238/okio/ZipFileSystem;

    invoke-direct {v4, v1, v2, v0, v5}, Lnicoid/network238/okio/ZipFileSystem;-><init>(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Ljava/util/Map;Ljava/lang/String;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_c

    if-eqz v3, :cond_e

    .line 573
    :try_start_11
    invoke-interface {v3}, Ljava/io/Closeable;->close()V

    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_a

    goto :goto_c

    :catchall_a
    move-exception v0

    :cond_e
    :goto_c
    return-object v4

    .line 569
    :cond_f
    :try_start_12
    throw v10

    .line 89
    :cond_10
    move-object/from16 v13, p2

    invoke-interface {v10}, Lnicoid/network238/okio/Source;->close()V

    const-wide/16 v10, -0x1

    add-long/2addr v6, v10

    cmp-long v0, v6, v4

    if-ltz v0, :cond_11

    goto/16 :goto_0

    .line 94
    :cond_11
    new-instance v0, Ljava/io/IOException;

    const-string v1, "not a zip: end of central directory signature not found"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_b
    move-exception v0

    .line 89
    invoke-interface {v10}, Lnicoid/network238/okio/Source;->close()V

    throw v0

    .line 73
    :cond_12
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lnicoid/network238/okio/FileHandle;->size()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_c

    :catchall_c
    move-exception v0

    move-object v1, v0

    if-eqz v3, :cond_13

    .line 573
    :try_start_13
    invoke-interface {v3}, Ljava/io/Closeable;->close()V

    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_d

    goto :goto_d

    :catchall_d
    move-exception v0

    .line 578
    invoke-static {v1, v0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 585
    :cond_13
    :goto_d
    throw v1
.end method

.method public static synthetic openZip$default(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/jvm/functions/Function1;ILjava/lang/Object;)Lnicoid/network238/okio/ZipFileSystem;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_0

    .line 64
    new-instance p2, Lnicoid/network238/okio/internal/ZipFilesKt$0;

    invoke-direct {p2}, Lnicoid/network238/okio/internal/ZipFilesKt$0;-><init>()V

    .line 61
    :cond_0
    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/internal/ZipFilesKt;->openZip(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okio/ZipFileSystem;

    move-result-object p0

    return-object p0
.end method

.method static final openZip$lambda$0(Lnicoid/network238/okio/internal/ZipEntry;)Z
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x1

    return p0
.end method

.method public static final readCentralDirectoryZipEntry(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okio/internal/ZipEntry;
    .registers 36
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v5, p0

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 190
    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    const v1, 0x2014b50

    if-ne v0, v1, :cond_7

    .line 197
    const-wide/16 v0, 0x4

    invoke-interface {v5, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    .line 198
    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v0

    const v1, 0xffff

    and-int v2, v0, v1

    const/4 v11, 0x1

    and-int/2addr v0, v11

    if-nez v0, :cond_6

    .line 203
    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v0

    and-int v22, v0, v1

    .line 204
    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v0

    and-int v26, v0, v1

    .line 205
    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v0

    and-int v25, v0, v1

    .line 208
    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    int-to-long v2, v0

    const-wide v6, 0xffffffffL

    and-long v16, v2, v6

    .line 209
    move-wide v2, v6

    new-instance v6, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

    invoke-direct {v6}, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;-><init>()V

    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    int-to-long v7, v0

    and-long/2addr v7, v2

    iput-wide v7, v6, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    .line 210
    new-instance v4, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

    invoke-direct {v4}, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;-><init>()V

    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    int-to-long v7, v0

    and-long/2addr v7, v2

    iput-wide v7, v4, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    .line 211
    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v0

    and-int/2addr v0, v1

    .line 212
    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v7

    and-int v12, v7, v1

    .line 213
    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v7

    and-int v13, v7, v1

    .line 215
    const-wide/16 v7, 0x8

    invoke-interface {v5, v7, v8}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    .line 216
    move-wide v8, v7

    new-instance v7, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

    invoke-direct {v7}, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;-><init>()V

    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v1

    int-to-long v14, v1

    and-long/2addr v14, v2

    iput-wide v14, v7, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    int-to-long v0, v0

    .line 217
    invoke-interface {v5, v0, v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8(J)Ljava/lang/String;

    move-result-object v14

    .line 218
    const/4 v15, 0x0

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-static {v14, v15, v15, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_5

    .line 222
    iget-wide v0, v4, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    cmp-long v0, v0, v2

    const-wide/16 v19, 0x0

    if-nez v0, :cond_0

    move-wide v0, v8

    goto :goto_0

    :cond_0
    move-wide/from16 v0, v19

    .line 223
    :goto_0
    move-wide/from16 v23, v2

    iget-wide v2, v6, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    cmp-long v2, v2, v23

    if-nez v2, :cond_1

    add-long/2addr v0, v8

    .line 224
    :cond_1
    iget-wide v2, v7, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    cmp-long v2, v2, v23

    if-nez v2, :cond_2

    add-long/2addr v0, v8

    :cond_2
    move-wide v2, v0

    .line 228
    new-instance v8, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v8}, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 229
    new-instance v9, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v9}, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 230
    const/4 v0, 0x2

    new-instance v10, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v10}, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 232
    new-instance v1, Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;

    invoke-direct {v1}, Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;-><init>()V

    .line 233
    move/from16 v21, v0

    new-instance v0, Lnicoid/network238/okio/internal/ZipFilesKt$3;

    move-object/from16 v18, v14

    const/4 v14, 0x0

    invoke-direct/range {v0 .. v10}, Lnicoid/network238/okio/internal/ZipFilesKt$3;-><init>(Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;JLnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)V

    invoke-static {v5, v12, v0}, Lnicoid/network238/okio/internal/ZipFilesKt;->readExtra(Lnicoid/network238/okio/BufferedSource;ILnicoid/network238/kotlin/jvm/functions/Function2;)V

    cmp-long v0, v2, v19

    if-lez v0, :cond_4

    .line 280
    iget-boolean v0, v1, Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;->element:Z

    if-eqz v0, :cond_3

    goto :goto_1

    .line 281
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "bad zip: zip64 extra required but absent"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    :goto_1
    int-to-long v0, v13

    .line 284
    invoke-interface {v5, v0, v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8(J)Ljava/lang/String;

    move-result-object v0

    .line 285
    sget-object v1, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    const-string v2, "/"

    invoke-static {v1, v2, v15, v11, v14}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/lang/String;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object v1

    move-object/from16 v3, v18

    invoke-virtual {v1, v3}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object v13

    .line 286
    const/4 v1, 0x2

    invoke-static {v3, v2, v15, v1, v14}, Lnicoid/network238/kotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v14

    .line 288
    new-instance v12, Lnicoid/network238/okio/internal/ZipEntry;

    .line 293
    iget-wide v1, v6, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    .line 294
    iget-wide v3, v4, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    .line 296
    iget-wide v5, v7, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    .line 299
    iget-object v7, v8, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    move-object/from16 v27, v7

    check-cast v27, Ljava/lang/Long;

    .line 300
    iget-object v7, v9, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    move-object/from16 v28, v7

    check-cast v28, Ljava/lang/Long;

    .line 301
    iget-object v7, v10, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    move-object/from16 v29, v7

    check-cast v29, Ljava/lang/Long;

    .line 288
    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const v33, 0xe000

    const/16 v34, 0x0

    move-object v15, v0

    move-wide/from16 v18, v1

    move-wide/from16 v20, v3

    move-wide/from16 v23, v5

    invoke-direct/range {v12 .. v34}, Lnicoid/network238/okio/internal/ZipEntry;-><init>(Lnicoid/network238/okio/Path;ZLjava/lang/String;JJJIJIILjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v12

    .line 218
    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string v1, "bad zip: filename contains 0x00"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 200
    :cond_6
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "unsupported zip: general purpose bit flag="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lnicoid/network238/okio/internal/ZipFilesKt;->getHex(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_7
    new-instance v2, Ljava/io/IOException;

    .line 193
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "bad zip: expected "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lnicoid/network238/okio/internal/ZipFilesKt;->getHex(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " but was "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lnicoid/network238/okio/internal/ZipFilesKt;->getHex(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 192
    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static final readCentralDirectoryZipEntry$lambda$1(Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;JLnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;IJ)Lnicoid/network238/kotlin/Unit;
    .registers 14

    const/4 v0, 0x1

    if-eq p10, v0, :cond_1

    const/16 p0, 0xa

    if-ne p10, p0, :cond_5

    const-wide/16 p0, 0x4

    cmp-long p2, p11, p0

    if-ltz p2, :cond_0

    .line 255
    invoke-interface {p4, p0, p1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    sub-long/2addr p11, p0

    long-to-int p0, p11

    .line 259
    new-instance p1, Lnicoid/network238/okio/internal/ZipFilesKt$1;

    invoke-direct {p1, p7, p4, p8, p9}, Lnicoid/network238/okio/internal/ZipFilesKt$1;-><init>(Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)V

    invoke-static {p4, p0, p1}, Lnicoid/network238/okio/internal/ZipFilesKt;->readExtra(Lnicoid/network238/okio/BufferedSource;ILnicoid/network238/kotlin/jvm/functions/Function2;)V

    goto :goto_1

    .line 253
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "bad zip: NTFS extra too short"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 236
    :cond_1
    iget-boolean p7, p0, Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;->element:Z

    if-nez p7, :cond_7

    .line 239
    iput-boolean v0, p0, Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;->element:Z

    cmp-long p0, p11, p1

    if-ltz p0, :cond_6

    .line 246
    iget-wide p0, p3, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    const-wide p7, 0xffffffffL

    cmp-long p2, p0, p7

    if-nez p2, :cond_2

    invoke-interface {p4}, Lnicoid/network238/okio/BufferedSource;->readLongLe()J

    move-result-wide p0

    :cond_2
    iput-wide p0, p3, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    .line 247
    iget-wide p0, p5, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    cmp-long p0, p0, p7

    const-wide/16 p1, 0x0

    if-nez p0, :cond_3

    invoke-interface {p4}, Lnicoid/network238/okio/BufferedSource;->readLongLe()J

    move-result-wide p9

    goto :goto_0

    :cond_3
    move-wide p9, p1

    :goto_0
    iput-wide p9, p5, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    .line 248
    iget-wide p9, p6, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    cmp-long p0, p9, p7

    if-nez p0, :cond_4

    invoke-interface {p4}, Lnicoid/network238/okio/BufferedSource;->readLongLe()J

    move-result-wide p1

    :cond_4
    iput-wide p1, p6, Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;->element:J

    .line 278
    :cond_5
    :goto_1
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0

    .line 242
    :cond_6
    new-instance p0, Ljava/io/IOException;

    const-string p1, "bad zip: zip64 extra too short"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 237
    :cond_7
    new-instance p0, Ljava/io/IOException;

    const-string p1, "bad zip: zip64 extra repeated"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final readCentralDirectoryZipEntry$lambda$1$0(Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;IJ)Lnicoid/network238/kotlin/Unit;
    .registers 9

    const/4 v0, 0x1

    if-ne p4, v0, :cond_2

    .line 262
    iget-object p4, p0, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    if-nez p4, :cond_1

    const-wide/16 v0, 0x18

    cmp-long p4, p5, v0

    if-nez p4, :cond_0

    .line 270
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readLongLe()J

    move-result-wide p4

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    iput-object p4, p0, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 271
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readLongLe()J

    move-result-wide p4

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    iput-object p0, p2, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 272
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readLongLe()J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    iput-object p0, p3, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    goto :goto_0

    .line 267
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "bad zip: NTFS extra attribute tag 0x0001 size != 24"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 263
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "bad zip: NTFS extra attribute tag 0x0001 repeated"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 275
    :cond_2
    :goto_0
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method private static final readEocdRecord(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okio/internal/EocdRecord;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    .line 308
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v2

    and-int/2addr v2, v1

    .line 309
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v3

    and-int/2addr v3, v1

    int-to-long v5, v3

    .line 310
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v3

    and-int/2addr v3, v1

    int-to-long v3, v3

    cmp-long v3, v5, v3

    if-nez v3, :cond_0

    if-nez v0, :cond_0

    if-nez v2, :cond_0

    .line 314
    const-wide/16 v2, 0x4

    invoke-interface {p0, v2, v3}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    .line 315
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    int-to-long v2, v0

    const-wide v7, 0xffffffffL

    and-long/2addr v7, v2

    .line 316
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result p0

    and-int v9, p0, v1

    .line 318
    new-instance v4, Lnicoid/network238/okio/internal/EocdRecord;

    invoke-direct/range {v4 .. v9}, Lnicoid/network238/okio/internal/EocdRecord;-><init>(JJI)V

    return-object v4

    .line 312
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "unsupported zip: spanned"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final readExtra(Lnicoid/network238/okio/BufferedSource;ILnicoid/network238/kotlin/jvm/functions/Function2;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/BufferedSource;",
            "I",
            "Lnicoid/network238/kotlin/jvm/functions/Function2;",
            ")V"
        }
    .end annotation

    int-to-long v0, p1

    :goto_0
    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_4

    const-wide/16 v4, 0x4

    cmp-long p1, v0, v4

    if-ltz p1, :cond_3

    .line 361
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result p1

    const v6, 0xffff

    and-int/2addr p1, v6

    .line 362
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v6

    int-to-long v6, v6

    const-wide/32 v8, 0xffff

    and-long/2addr v6, v8

    sub-long/2addr v0, v4

    cmp-long v4, v0, v6

    if-ltz v4, :cond_2

    .line 367
    invoke-interface {p0, v6, v7}, Lnicoid/network238/okio/BufferedSource;->require(J)V

    .line 368
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    .line 369
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {p2, v8, v9}, Lnicoid/network238/kotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v8

    invoke-virtual {v8}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v8

    add-long/2addr v8, v6

    sub-long/2addr v8, v4

    cmp-long v2, v8, v2

    if-ltz v2, :cond_1

    if-lez v2, :cond_0

    .line 376
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object p1

    invoke-virtual {p1, v8, v9}, Lnicoid/network238/okio/Buffer;->skip(J)V

    :cond_0
    sub-long/2addr v0, v6

    goto :goto_0

    .line 373
    :cond_1
    new-instance p0, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "unsupported zip: too many bytes processed for "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 365
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "bad zip: truncated value in extra field"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 359
    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string p1, "bad zip: truncated header in extra field"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    return-void
.end method

.method public static final readLocalHeader(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/internal/ZipEntry;)Lnicoid/network238/okio/internal/ZipEntry;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 388
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/ZipFilesKt;->readOrSkipLocalHeader(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/internal/ZipEntry;)Lnicoid/network238/okio/internal/ZipEntry;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method private static final readOrSkipLocalHeader(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/internal/ZipEntry;)Lnicoid/network238/okio/internal/ZipEntry;
    .registers 8

    .line 398
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    const v1, 0x4034b50

    if-ne v0, v1, :cond_2

    .line 404
    const-wide/16 v0, 0x2

    invoke-interface {p0, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    .line 405
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v0

    const v1, 0xffff

    and-int v2, v0, v1

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_1

    .line 409
    const-wide/16 v2, 0x12

    invoke-interface {p0, v2, v3}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    .line 410
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v0

    int-to-long v2, v0

    const-wide/32 v4, 0xffff

    and-long/2addr v2, v4

    .line 411
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readShortLe()S

    move-result v0

    and-int/2addr v0, v1

    .line 412
    invoke-interface {p0, v2, v3}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    if-nez p1, :cond_0

    int-to-long v0, v0

    .line 415
    invoke-interface {p0, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    const/4 p0, 0x0

    return-object p0

    .line 419
    :cond_0
    new-instance v1, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v1}, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 420
    new-instance v2, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v2}, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 421
    new-instance v3, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v3}, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 423
    new-instance v4, Lnicoid/network238/okio/internal/ZipFilesKt$2;

    invoke-direct {v4, p0, v1, v2, v3}, Lnicoid/network238/okio/internal/ZipFilesKt$2;-><init>(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)V

    invoke-static {p0, v0, v4}, Lnicoid/network238/okio/internal/ZipFilesKt;->readExtra(Lnicoid/network238/okio/BufferedSource;ILnicoid/network238/kotlin/jvm/functions/Function2;)V

    .line 453
    iget-object p0, v1, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    .line 454
    iget-object v0, v2, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    .line 455
    iget-object v1, v3, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    .line 452
    invoke-virtual {p1, p0, v0, v1}, Lnicoid/network238/okio/internal/ZipEntry;->copy$okio(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Lnicoid/network238/okio/internal/ZipEntry;

    move-result-object p0

    return-object p0

    .line 407
    :cond_1
    new-instance p0, Ljava/io/IOException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "unsupported zip: general purpose bit flag="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lnicoid/network238/okio/internal/ZipFilesKt;->getHex(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 400
    :cond_2
    new-instance p0, Ljava/io/IOException;

    .line 401
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "bad zip: expected "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lnicoid/network238/okio/internal/ZipFilesKt;->getHex(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " but was "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {v0}, Lnicoid/network238/okio/internal/ZipFilesKt;->getHex(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 400
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static final readOrSkipLocalHeader$lambda$0(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;IJ)Lnicoid/network238/kotlin/Unit;
    .registers 16

    const/16 v0, 0x5455

    if-ne p4, v0, :cond_a

    const-wide/16 v0, 0x1

    cmp-long p4, p5, v0

    const-string v2, "bad zip: extended timestamp extra too short"

    if-ltz p4, :cond_9

    .line 429
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result p4

    and-int/lit8 v3, p4, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v3, v5, :cond_0

    move v3, v5

    goto :goto_0

    :cond_0
    move v3, v4

    :goto_0
    and-int/lit8 v6, p4, 0x2

    const/4 v7, 0x2

    if-ne v6, v7, :cond_1

    move v6, v5

    goto :goto_1

    :cond_1
    move v6, v4

    :goto_1
    const/4 v7, 0x4

    and-int/2addr p4, v7

    if-ne p4, v7, :cond_2

    move v4, v5

    :cond_2
    if-eqz v3, :cond_3

    const-wide/16 v0, 0x5

    :cond_3
    const-wide/16 v7, 0x4

    if-eqz v6, :cond_4

    add-long/2addr v0, v7

    :cond_4
    if-eqz v4, :cond_5

    add-long/2addr v0, v7

    :cond_5
    cmp-long p4, p5, v0

    if-ltz p4, :cond_8

    if-eqz v3, :cond_6

    .line 445
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result p4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    iput-object p4, p1, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    :cond_6
    if-eqz v6, :cond_7

    .line 446
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p2, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    :cond_7
    if-eqz v4, :cond_a

    .line 447
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    iput-object p0, p3, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    goto :goto_2

    .line 442
    :cond_8
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 427
    :cond_9
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 450
    :cond_a
    :goto_2
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method private static final readZip64EocdRecord(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/internal/EocdRecord;)Lnicoid/network238/okio/internal/EocdRecord;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 327
    const-wide/16 v0, 0xc

    invoke-interface {p0, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    .line 328
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v0

    .line 329
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readIntLe()I

    move-result v1

    .line 330
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readLongLe()J

    move-result-wide v3

    .line 331
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readLongLe()J

    move-result-wide v5

    cmp-long v2, v3, v5

    if-nez v2, :cond_0

    if-nez v0, :cond_0

    if-nez v1, :cond_0

    .line 335
    const-wide/16 v0, 0x8

    invoke-interface {p0, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    .line 336
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readLongLe()J

    move-result-wide v5

    .line 338
    new-instance v2, Lnicoid/network238/okio/internal/EocdRecord;

    .line 341
    invoke-virtual {p1}, Lnicoid/network238/okio/internal/EocdRecord;->getCommentByteCount()I

    move-result v7

    .line 338
    invoke-direct/range {v2 .. v7}, Lnicoid/network238/okio/internal/EocdRecord;-><init>(JJI)V

    return-object v2

    .line 333
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "unsupported zip: spanned"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final skipLocalHeader(Lnicoid/network238/okio/BufferedSource;)V
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 384
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lnicoid/network238/okio/internal/ZipFilesKt;->readOrSkipLocalHeader(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/internal/ZipEntry;)Lnicoid/network238/okio/internal/ZipEntry;

    return-void
.end method
