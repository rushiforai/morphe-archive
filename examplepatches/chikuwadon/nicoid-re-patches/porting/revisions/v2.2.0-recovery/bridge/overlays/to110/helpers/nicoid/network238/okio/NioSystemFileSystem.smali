.class public Lnicoid/network238/okio/NioSystemFileSystem;
.super Lnicoid/network238/okio/JvmSystemFileSystem;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0000\u0008\u0010\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0012\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0008\u001a\u00020\tH\u0004J\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b*\u00020\u000cH\u0002\u00a2\u0006\u0002\u0010\rJ\u0018\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u0007H\u0016J\u0018\u0010\u0012\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u0007H\u0016J\u0008\u0010\u0013\u001a\u00020\u0014H\u0016\u00a8\u0006\u0015"
    }
    d2 = {
        "Lnicoid/network238/okio/NioSystemFileSystem;",
        "Lnicoid/network238/okio/JvmSystemFileSystem;",
        "<init>",
        "()V",
        "metadataOrNull",
        "Lnicoid/network238/okio/FileMetadata;",
        "path",
        "Lnicoid/network238/okio/Path;",
        "nioPath",
        "Ljava/nio/file/Path;",
        "zeroToNull",
        "",
        "Ljava/nio/file/attribute/FileTime;",
        "(Ljava/nio/file/attribute/FileTime;)Ljava/lang/Long;",
        "atomicMove",
        "",
        "source",
        "target",
        "createSymlink",
        "toString",
        "",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Lnicoid/network238/okio/JvmSystemFileSystem;-><init>()V

    return-void
.end method

.method private final zeroToNull(Ljava/nio/file/attribute/FileTime;)Ljava/lang/Long;
    .registers 6

    .line 73
    invoke-virtual {p1}, Ljava/nio/file/attribute/FileTime;->toMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public atomicMove(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    :try_start_0
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toNioPath()Ljava/nio/file/Path;

    move-result-object p1

    invoke-virtual {p2}, Lnicoid/network238/okio/Path;->toNioPath()Ljava/nio/file/Path;

    move-result-object p2

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/nio/file/CopyOption;

    sget-object v1, Ljava/nio/file/StandardCopyOption;->ATOMIC_MOVE:Ljava/nio/file/StandardCopyOption;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-static {p1, p2, v0}, Ljava/nio/file/Files;->move(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;
    :try_end_0
    .catch Ljava/nio/file/NoSuchFileException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 82
    new-instance p1, Ljava/io/IOException;

    const-string p2, "atomic move not supported"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_1
    move-exception p1

    .line 80
    new-instance p2, Ljava/io/FileNotFoundException;

    invoke-virtual {p1}, Ljava/nio/file/NoSuchFileException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public createSymlink(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toNioPath()Ljava/nio/file/Path;

    move-result-object p1

    invoke-virtual {p2}, Lnicoid/network238/okio/Path;->toNioPath()Ljava/nio/file/Path;

    move-result-object p2

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/nio/file/attribute/FileAttribute;

    invoke-static {p1, p2, v0}, Ljava/nio/file/Files;->createSymbolicLink(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/attribute/FileAttribute;)Ljava/nio/file/Path;

    return-void
.end method

.method protected final metadataOrNull(Ljava/nio/file/Path;)Lnicoid/network238/okio/FileMetadata;
    .registers 20

    move-object/from16 v1, p0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    const/4 v2, 0x0

    :try_start_0
    const-class v0, Ljava/nio/file/attribute/BasicFileAttributes;

    .line 43
    const/4 v3, 0x1

    new-array v4, v3, [Ljava/nio/file/LinkOption;

    sget-object v5, Ljava/nio/file/LinkOption;->NOFOLLOW_LINKS:Ljava/nio/file/LinkOption;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 40
    move-object/from16 v5, p1

    invoke-static {v5, v0, v4}, Ljava/nio/file/Files;->readAttributes(Ljava/nio/file/Path;Ljava/lang/Class;[Ljava/nio/file/LinkOption;)Ljava/nio/file/attribute/BasicFileAttributes;

    move-result-object v0
    :try_end_0
    .catch Ljava/nio/file/NoSuchFileException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/file/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    invoke-interface {v0}, Ljava/nio/file/attribute/BasicFileAttributes;->isSymbolicLink()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 52
    invoke-static {v5}, Ljava/nio/file/Files;->readSymbolicLink(Ljava/nio/file/Path;)Ljava/nio/file/Path;

    move-result-object v4

    goto :goto_0

    :cond_0
    move-object v4, v2

    .line 57
    :goto_0
    new-instance v7, Lnicoid/network238/okio/FileMetadata;

    .line 58
    invoke-interface {v0}, Ljava/nio/file/attribute/BasicFileAttributes;->isRegularFile()Z

    move-result v8

    .line 59
    invoke-interface {v0}, Ljava/nio/file/attribute/BasicFileAttributes;->isDirectory()Z

    move-result v9

    if-eqz v4, :cond_1

    .line 60
    sget-object v5, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    invoke-static {v5, v4, v6, v3, v2}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/nio/file/Path;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object v3

    move-object v10, v3

    goto :goto_1

    :cond_1
    move-object v10, v2

    .line 61
    :goto_1
    invoke-interface {v0}, Ljava/nio/file/attribute/BasicFileAttributes;->size()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    .line 62
    invoke-interface {v0}, Ljava/nio/file/attribute/BasicFileAttributes;->creationTime()Ljava/nio/file/attribute/FileTime;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-direct {v1, v3}, Lnicoid/network238/okio/NioSystemFileSystem;->zeroToNull(Ljava/nio/file/attribute/FileTime;)Ljava/lang/Long;

    move-result-object v3

    move-object v12, v3

    goto :goto_2

    :cond_2
    move-object v12, v2

    .line 63
    :goto_2
    invoke-interface {v0}, Ljava/nio/file/attribute/BasicFileAttributes;->lastModifiedTime()Ljava/nio/file/attribute/FileTime;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-direct {v1, v3}, Lnicoid/network238/okio/NioSystemFileSystem;->zeroToNull(Ljava/nio/file/attribute/FileTime;)Ljava/lang/Long;

    move-result-object v3

    move-object v13, v3

    goto :goto_3

    :cond_3
    move-object v13, v2

    .line 64
    :goto_3
    invoke-interface {v0}, Ljava/nio/file/attribute/BasicFileAttributes;->lastAccessTime()Ljava/nio/file/attribute/FileTime;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-direct {v1, v0}, Lnicoid/network238/okio/NioSystemFileSystem;->zeroToNull(Ljava/nio/file/attribute/FileTime;)Ljava/lang/Long;

    move-result-object v2

    :cond_4
    move-object v14, v2

    .line 57
    const/4 v15, 0x0

    const/16 v16, 0x80

    const/16 v17, 0x0

    invoke-direct/range {v7 .. v17}, Lnicoid/network238/okio/FileMetadata;-><init>(ZZLnicoid/network238/okio/Path;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/util/Map;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v7

    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    :goto_4
    return-object v2
.end method

.method public metadataOrNull(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toNioPath()Ljava/nio/file/Path;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/NioSystemFileSystem;->metadataOrNull(Ljava/nio/file/Path;)Lnicoid/network238/okio/FileMetadata;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 90
    const-string v0, "NioSystemFileSystem"

    return-object v0
.end method
