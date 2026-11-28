.class final synthetic Lnicoid/network238/okio/Okio__ZlibOkioKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u0012\u0010\u0000\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "openZip",
        "Lnicoid/network238/okio/FileSystem;",
        "zipPath",
        "Lnicoid/network238/okio/Path;",
        "okio"
    }
    k = 0x5
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
    xs = "nicoid/network238/okio/Okio"
.end annotation


# direct methods
.method public static final openZip(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileSystem;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    const/4 v0, 0x0

    const/4 v1, 0x4

    invoke-static {p1, p0, v0, v1, v0}, Lnicoid/network238/okio/internal/ZipFilesKt;->openZip$default(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/jvm/functions/Function1;ILjava/lang/Object;)Lnicoid/network238/okio/ZipFileSystem;

    move-result-object p0

    return-object p0
.end method
