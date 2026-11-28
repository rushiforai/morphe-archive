.class public final Lnicoid/network238/okio/Path$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/Path;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001b\u0010\u0006\u001a\u00020\u0007*\u00020\u00052\u0008\u0008\u0002\u0010\u0008\u001a\u00020\tH\u0007\u00a2\u0006\u0002\u0008\nJ\u001b\u0010\u000b\u001a\u00020\u0007*\u00020\u000c2\u0008\u0008\u0002\u0010\u0008\u001a\u00020\tH\u0007\u00a2\u0006\u0002\u0008\nJ\u001b\u0010\u000b\u001a\u00020\u0007*\u00020\r2\u0008\u0008\u0002\u0010\u0008\u001a\u00020\tH\u0007\u00a2\u0006\u0002\u0008\nR\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087D\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okio/Path$Companion;",
        "",
        "<init>",
        "()V",
        "DIRECTORY_SEPARATOR",
        "",
        "toPath",
        "Lnicoid/network238/okio/Path;",
        "normalize",
        "",
        "get",
        "toOkioPath",
        "Ljava/io/File;",
        "Ljava/nio/file/Path;",
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

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okio/Path$Companion;-><init>()V

    return-void
.end method

.method public static synthetic get$default(Lnicoid/network238/okio/Path$Companion;Ljava/io/File;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 124
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/io/File;Z)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic get$default(Lnicoid/network238/okio/Path$Companion;Ljava/lang/String;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 119
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/lang/String;Z)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic get$default(Lnicoid/network238/okio/Path$Companion;Ljava/nio/file/Path;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 129
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/nio/file/Path;Z)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final get(Ljava/io/File;)Lnicoid/network238/okio/Path;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/io/File;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final get(Ljava/io/File;Z)Lnicoid/network238/okio/Path;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 124
    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/lang/String;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final get(Ljava/lang/String;)Lnicoid/network238/okio/Path;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/lang/String;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final get(Ljava/lang/String;Z)Lnicoid/network238/okio/Path;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    invoke-static {p1, p2}, Lnicoid/network238/okio/internal/-Path;->commonToPath(Ljava/lang/String;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final get(Ljava/nio/file/Path;)Lnicoid/network238/okio/Path;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/nio/file/Path;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public final get(Ljava/nio/file/Path;Z)Lnicoid/network238/okio/Path;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Path$Companion;->get(Ljava/lang/String;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method
