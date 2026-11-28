.class public Lnicoid/network238/okio/JvmSystemFileSystem;
.super Lnicoid/network238/okio/FileSystem;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0010\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0005H\u0016J\u0012\u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0006\u0010\u0006\u001a\u00020\u0005H\u0016J\u0016\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u00050\n2\u0006\u0010\u000b\u001a\u00020\u0005H\u0016J\u0018\u0010\u000c\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\n2\u0006\u0010\u000b\u001a\u00020\u0005H\u0016J \u0010\t\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\n2\u0006\u0010\u000b\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000eH\u0002J\u0010\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0005H\u0016J \u0010\u0012\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00052\u0006\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u000eH\u0016J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0011\u001a\u00020\u0005H\u0016J\u0018\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0011\u001a\u00020\u00052\u0006\u0010\u0013\u001a\u00020\u000eH\u0016J\u0018\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u0011\u001a\u00020\u00052\u0006\u0010\u0014\u001a\u00020\u000eH\u0016J\u0018\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u000b\u001a\u00020\u00052\u0006\u0010\u0013\u001a\u00020\u000eH\u0016J\u0018\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u0015\u001a\u00020\u00052\u0006\u0010\u001d\u001a\u00020\u0005H\u0016J\u0018\u0010\u001e\u001a\u00020\u001b2\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0014\u001a\u00020\u000eH\u0016J\u0018\u0010\u001f\u001a\u00020\u001b2\u0006\u0010\u0015\u001a\u00020\u00052\u0006\u0010\u001d\u001a\u00020\u0005H\u0016J\u0008\u0010 \u001a\u00020!H\u0016J\u000c\u0010\"\u001a\u00020\u001b*\u00020\u0005H\u0002J\u000c\u0010#\u001a\u00020\u001b*\u00020\u0005H\u0002\u00a8\u0006$"
    }
    d2 = {
        "Lnicoid/network238/okio/JvmSystemFileSystem;",
        "Lnicoid/network238/okio/FileSystem;",
        "<init>",
        "()V",
        "canonicalize",
        "Lnicoid/network238/okio/Path;",
        "path",
        "metadataOrNull",
        "Lnicoid/network238/okio/FileMetadata;",
        "list",
        "",
        "dir",
        "listOrNull",
        "throwOnFailure",
        "",
        "openReadOnly",
        "Lnicoid/network238/okio/FileHandle;",
        "file",
        "openReadWrite",
        "mustCreate",
        "mustExist",
        "source",
        "Lnicoid/network238/okio/Source;",
        "sink",
        "Lnicoid/network238/okio/Sink;",
        "appendingSink",
        "createDirectory",
        "",
        "atomicMove",
        "target",
        "delete",
        "createSymlink",
        "toString",
        "",
        "requireExist",
        "requireCreate",
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

    .line 28
    invoke-direct {p0}, Lnicoid/network238/okio/FileSystem;-><init>()V

    return-void
.end method

.method private final list(Lnicoid/network238/okio/Path;Z)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Path;",
            "Z)",
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation

    .line 67
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    if-eqz p2, :cond_1

    .line 71
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_0

    new-instance p2, Ljava/io/FileNotFoundException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "no such file: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 72
    :cond_0
    new-instance p2, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "failed to list "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_1
    const/4 p1, 0x0

    return-object p1

    .line 77
    :cond_2
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 159
    array-length v0, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    aget-object v3, v1, v2

    .line 77
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v3}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object v3

    .line 160
    invoke-interface {p2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 78
    :cond_3
    invoke-static {p2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->sort(Ljava/util/List;)V

    return-object p2
.end method

.method private final requireCreate(Lnicoid/network238/okio/Path;)V
    .registers 4

    .line 155
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->exists(Lnicoid/network238/okio/Path;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " already exists."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final requireExist(Lnicoid/network238/okio/Path;)V
    .registers 4

    .line 151
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->exists(Lnicoid/network238/okio/Path;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " doesn\'t exist."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public appendingSink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_0

    .line 105
    invoke-direct {p0, p1}, Lnicoid/network238/okio/JvmSystemFileSystem;->requireExist(Lnicoid/network238/okio/Path;)V

    .line 106
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lnicoid/network238/okio/Okio;->sink(Ljava/io/File;Z)Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1
.end method

.method public atomicMove(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 125
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p2}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 126
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "failed to move "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " to "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public canonicalize(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, p1, v3, v1, v2}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/io/File;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1

    .line 31
    :cond_0
    new-instance p1, Ljava/io/FileNotFoundException;

    const-string v0, "no such file"

    invoke-direct {p1, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public createDirectory(Lnicoid/network238/okio/Path;Z)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-result v0

    if-nez v0, :cond_2

    .line 111
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/JvmSystemFileSystem;->metadataOrNull(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lnicoid/network238/okio/FileMetadata;->isDirectory()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 114
    :cond_0
    new-instance p2, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " already exists."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 119
    :cond_1
    new-instance p2, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "failed to create directory: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    :goto_0
    return-void
.end method

.method public createSymlink(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 143
    new-instance p1, Ljava/io/IOException;

    const-string p2, "unsupported"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public delete(Lnicoid/network238/okio/Path;Z)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_3

    .line 134
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_2

    .line 137
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 138
    :cond_0
    new-instance p2, Ljava/io/FileNotFoundException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "no such file: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 137
    :cond_1
    new-instance p2, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "failed to delete "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    :goto_0
    return-void

    .line 132
    :cond_3
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string p2, "interrupted"

    invoke-direct {p1, p2}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public list(Lnicoid/network238/okio/Path;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Path;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okio/JvmSystemFileSystem;->list(Lnicoid/network238/okio/Path;Z)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p1
.end method

.method public listOrNull(Lnicoid/network238/okio/Path;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Path;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okio/JvmSystemFileSystem;->list(Lnicoid/network238/okio/Path;Z)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public metadataOrNull(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;
    .registers 13

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v1

    .line 38
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    .line 39
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    .line 40
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v5

    if-nez v1, :cond_0

    if-nez v2, :cond_0

    const-wide/16 v7, 0x0

    cmp-long v0, v3, v7

    if-nez v0, :cond_0

    cmp-long v0, v5, v7

    if-nez v0, :cond_0

    .line 46
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 51
    :cond_0
    new-instance v0, Lnicoid/network238/okio/FileMetadata;

    .line 55
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 57
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 51
    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v9, 0x80

    const/4 v10, 0x0

    move-object v4, p1

    invoke-direct/range {v0 .. v10}, Lnicoid/network238/okio/FileMetadata;-><init>(ZZLnicoid/network238/okio/Path;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/util/Map;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public openReadOnly(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileHandle;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    new-instance v0, Lnicoid/network238/okio/JvmFileHandle;

    new-instance v1, Ljava/io/RandomAccessFile;

    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object p1

    const-string v2, "r"

    invoke-direct {v1, p1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-direct {v0, p1, v1}, Lnicoid/network238/okio/JvmFileHandle;-><init>(ZLjava/io/RandomAccessFile;)V

    return-object v0
.end method

.method public openReadWrite(Lnicoid/network238/okio/Path;ZZ)Lnicoid/network238/okio/FileHandle;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 87
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Cannot require mustCreate and mustExist at the same time."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_0
    if-eqz p2, :cond_1

    .line 90
    invoke-direct {p0, p1}, Lnicoid/network238/okio/JvmSystemFileSystem;->requireCreate(Lnicoid/network238/okio/Path;)V

    :cond_1
    if-eqz p3, :cond_2

    .line 91
    invoke-direct {p0, p1}, Lnicoid/network238/okio/JvmSystemFileSystem;->requireExist(Lnicoid/network238/okio/Path;)V

    .line 92
    :cond_2
    new-instance p2, Lnicoid/network238/okio/JvmFileHandle;

    new-instance p3, Ljava/io/RandomAccessFile;

    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object p1

    const-string v0, "rw"

    invoke-direct {p3, p1, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-direct {p2, p1, p3}, Lnicoid/network238/okio/JvmFileHandle;-><init>(ZLjava/io/RandomAccessFile;)V

    return-object p2
.end method

.method public sink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_0

    .line 100
    invoke-direct {p0, p1}, Lnicoid/network238/okio/JvmSystemFileSystem;->requireCreate(Lnicoid/network238/okio/Path;)V

    .line 101
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object p1

    const/4 p2, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p1, v1, p2, v0}, Lnicoid/network238/okio/Okio;->sink$default(Ljava/io/File;ZILjava/lang/Object;)Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1
.end method

.method public source(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Source;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/okio/Okio;->source(Ljava/io/File;)Lnicoid/network238/okio/Source;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 146
    const-string v0, "JvmSystemFileSystem"

    return-object v0
.end method
