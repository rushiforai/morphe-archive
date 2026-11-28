.class public final Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$fileSystem$1;
.super Lnicoid/network238/okio/ForwardingFileSystem;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;-><init>(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;IIJLnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/cache/DiskLruCache$fileSystem$1",
        "Lnicoid/network238/okio/ForwardingFileSystem;",
        "sink",
        "Lnicoid/network238/okio/Sink;",
        "file",
        "Lnicoid/network238/okio/Path;",
        "mustCreate",
        "",
        "okhttp"
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
.method constructor <init>(Lnicoid/network238/okio/FileSystem;)V
    .registers 2

    .line 102
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingFileSystem;-><init>(Lnicoid/network238/okio/FileSystem;)V

    return-void
.end method


# virtual methods
.method public sink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->parent()Lnicoid/network238/okio/Path;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 108
    invoke-virtual {p0, v0}, Lnicoid/network238/okio/FileSystem;->createDirectories(Lnicoid/network238/okio/Path;)V

    .line 110
    :cond_0
    invoke-super {p0, p1, p2}, Lnicoid/network238/okio/ForwardingFileSystem;->sink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1
.end method
