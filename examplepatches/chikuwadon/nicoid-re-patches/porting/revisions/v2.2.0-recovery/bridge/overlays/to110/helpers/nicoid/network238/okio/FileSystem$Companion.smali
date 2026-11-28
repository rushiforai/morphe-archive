.class public final Lnicoid/network238/okio/FileSystem$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/FileSystem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0011\u0010\t\u001a\u00020\u0005*\u00020\nH\u0007\u00a2\u0006\u0002\u0008\u000bR\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00020\u00078\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0008\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lnicoid/network238/okio/FileSystem$Companion;",
        "",
        "<init>",
        "()V",
        "SYSTEM",
        "Lnicoid/network238/okio/FileSystem;",
        "SYSTEM_TEMPORARY_DIRECTORY",
        "Lnicoid/network238/okio/Path;",
        "RESOURCES",
        "asOkioFileSystem",
        "Ljava/nio/file/FileSystem;",
        "get",
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
.method private constructor <init>()V
    .registers 1

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okio/FileSystem$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final get(Ljava/nio/file/FileSystem;)Lnicoid/network238/okio/FileSystem;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 188
    new-instance v0, Lnicoid/network238/okio/NioFileSystemWrappingFileSystem;

    invoke-direct {v0, p1}, Lnicoid/network238/okio/NioFileSystemWrappingFileSystem;-><init>(Ljava/nio/file/FileSystem;)V

    return-object v0
.end method
