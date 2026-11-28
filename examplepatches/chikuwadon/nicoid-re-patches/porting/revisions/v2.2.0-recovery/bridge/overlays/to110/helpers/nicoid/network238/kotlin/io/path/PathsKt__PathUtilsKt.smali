.class abstract Lnicoid/network238/kotlin/io/path/PathsKt__PathUtilsKt;
.super Lnicoid/network238/kotlin/io/path/PathsKt__PathRecursiveFunctionsKt;
.source "SourceFile"


# direct methods
.method public static final listDirectoryEntries(Ljava/nio/file/Path;Ljava/lang/String;)Ljava/util/List;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 400
    invoke-static {p0, p1}, Ljava/nio/file/Files;->newDirectoryStream(Ljava/nio/file/Path;Ljava/lang/String;)Ljava/nio/file/DirectoryStream;

    move-result-object p0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static synthetic listDirectoryEntries$default(Ljava/nio/file/Path;Ljava/lang/String;ILjava/lang/Object;)Ljava/util/List;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 399
    const-string p1, "*"

    .line 396
    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/io/path/PathsKt__PathUtilsKt;->listDirectoryEntries(Ljava/nio/file/Path;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
