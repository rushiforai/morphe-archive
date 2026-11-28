.class public final Lnicoid/network238/okio/internal/ResourceFileSystem;
.super Lnicoid/network238/okio/FileSystem;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0000\u0018\u0000 02\u00020\u0001:\u00010B#\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0001\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0010\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\u0012\u001a\u00020\u000cH\u0016J\u0010\u0010\u0013\u001a\u00020\u000c2\u0006\u0010\u0012\u001a\u00020\u000cH\u0002J\u0016\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\n2\u0006\u0010\u0015\u001a\u00020\u000cH\u0016J\u0018\u0010\u0016\u001a\n\u0012\u0004\u0012\u00020\u000c\u0018\u00010\n2\u0006\u0010\u0015\u001a\u00020\u000cH\u0016J\u0010\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u000cH\u0016J \u0010\u001a\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u000c2\u0006\u0010\u001b\u001a\u00020\u00052\u0006\u0010\u001c\u001a\u00020\u0005H\u0016J\u0012\u0010\u001d\u001a\u0004\u0018\u00010\u001e2\u0006\u0010\u0012\u001a\u00020\u000cH\u0016J\u0010\u0010\u001f\u001a\u00020 2\u0006\u0010\u0019\u001a\u00020\u000cH\u0016J\u0018\u0010!\u001a\u00020\"2\u0006\u0010\u0019\u001a\u00020\u000c2\u0006\u0010\u001b\u001a\u00020\u0005H\u0016J\u0018\u0010#\u001a\u00020\"2\u0006\u0010\u0019\u001a\u00020\u000c2\u0006\u0010\u001c\u001a\u00020\u0005H\u0016J\u0018\u0010$\u001a\u00020%2\u0006\u0010\u0015\u001a\u00020\u000c2\u0006\u0010\u001b\u001a\u00020\u0005H\u0016J\u0018\u0010&\u001a\u00020%2\u0006\u0010\u001f\u001a\u00020\u000c2\u0006\u0010\'\u001a\u00020\u000cH\u0016J\u0018\u0010(\u001a\u00020%2\u0006\u0010\u0012\u001a\u00020\u000c2\u0006\u0010\u001c\u001a\u00020\u0005H\u0016J\u0018\u0010)\u001a\u00020%2\u0006\u0010\u001f\u001a\u00020\u000c2\u0006\u0010\'\u001a\u00020\u000cH\u0016J\u000c\u0010*\u001a\u00020+*\u00020\u000cH\u0002J\u001e\u0010,\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u000c0\u000b0\n*\u00020\u0003H\u0002J\u001a\u0010-\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u000c\u0018\u00010\u000b*\u00020.H\u0002J\u001a\u0010/\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u000c\u0018\u00010\u000b*\u00020.H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000R-\u0010\t\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u000c0\u000b0\n8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\r\u0010\u000e\u00a8\u00061"
    }
    d2 = {
        "Lnicoid/network238/okio/internal/ResourceFileSystem;",
        "Lnicoid/network238/okio/FileSystem;",
        "classLoader",
        "Ljava/lang/ClassLoader;",
        "indexEagerly",
        "",
        "systemFileSystem",
        "<init>",
        "(Ljava/lang/ClassLoader;ZLnicoid/network238/okio/FileSystem;)V",
        "roots",
        "",
        "Lnicoid/network238/kotlin/Pair;",
        "Lnicoid/network238/okio/Path;",
        "getRoots",
        "()Ljava/util/List;",
        "roots$delegate",
        "Lnicoid/network238/kotlin/Lazy;",
        "canonicalize",
        "path",
        "canonicalizeInternal",
        "list",
        "dir",
        "listOrNull",
        "openReadOnly",
        "Lnicoid/network238/okio/FileHandle;",
        "file",
        "openReadWrite",
        "mustCreate",
        "mustExist",
        "metadataOrNull",
        "Lnicoid/network238/okio/FileMetadata;",
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
        "toRelativePath",
        "",
        "toClasspathRoots",
        "toFileRoot",
        "Ljava/net/URL;",
        "toJarRoot",
        "Companion",
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


# static fields
.field private static final Companion:Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

.field private static final ROOT:Lnicoid/network238/okio/Path;


# instance fields
.field private final classLoader:Ljava/lang/ClassLoader;

.field private final roots$delegate:Lnicoid/network238/kotlin/Lazy;

.field private final systemFileSystem:Lnicoid/network238/okio/FileSystem;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->Companion:Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

    .line 205
    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const-string v4, "/"

    invoke-static {v0, v4, v2, v3, v1}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/lang/String;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->ROOT:Lnicoid/network238/okio/Path;

    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;ZLnicoid/network238/okio/FileSystem;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    invoke-direct {p0}, Lnicoid/network238/okio/FileSystem;-><init>()V

    .line 46
    iput-object p1, p0, Lnicoid/network238/okio/internal/ResourceFileSystem;->classLoader:Ljava/lang/ClassLoader;

    .line 48
    iput-object p3, p0, Lnicoid/network238/okio/internal/ResourceFileSystem;->systemFileSystem:Lnicoid/network238/okio/FileSystem;

    .line 50
    new-instance p1, Lnicoid/network238/okio/internal/ResourceFileSystem$1;

    invoke-direct {p1, p0}, Lnicoid/network238/okio/internal/ResourceFileSystem$1;-><init>(Lnicoid/network238/okio/internal/ResourceFileSystem;)V

    invoke-static {p1}, Lnicoid/network238/kotlin/LazyKt;->lazy(Lnicoid/network238/kotlin/jvm/functions/Function0;)Lnicoid/network238/kotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okio/internal/ResourceFileSystem;->roots$delegate:Lnicoid/network238/kotlin/Lazy;

    if-eqz p2, :cond_0

    .line 54
    invoke-direct {p0}, Lnicoid/network238/okio/internal/ResourceFileSystem;->getRoots()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/ClassLoader;ZLnicoid/network238/okio/FileSystem;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 6

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 48
    sget-object p3, Lnicoid/network238/okio/FileSystem;->SYSTEM:Lnicoid/network238/okio/FileSystem;

    .line 45
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okio/internal/ResourceFileSystem;-><init>(Ljava/lang/ClassLoader;ZLnicoid/network238/okio/FileSystem;)V

    return-void
.end method

.method public static final synthetic access$getROOT$cp()Lnicoid/network238/okio/Path;
    .registers 1

    .line 45
    sget-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->ROOT:Lnicoid/network238/okio/Path;

    return-object v0
.end method

.method private final canonicalizeInternal(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;
    .registers 4

    .line 65
    sget-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->ROOT:Lnicoid/network238/okio/Path;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/okio/Path;->resolve(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method private final getRoots()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/kotlin/Pair;",
            ">;"
        }
    .end annotation

    .line 50
    iget-object v0, p0, Lnicoid/network238/okio/internal/ResourceFileSystem;->roots$delegate:Lnicoid/network238/kotlin/Lazy;

    invoke-interface {v0}, Lnicoid/network238/kotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method static final roots_delegate$lambda$0(Lnicoid/network238/okio/internal/ResourceFileSystem;)Ljava/util/List;
    .registers 2

    .line 50
    iget-object v0, p0, Lnicoid/network238/okio/internal/ResourceFileSystem;->classLoader:Ljava/lang/ClassLoader;

    invoke-direct {p0, v0}, Lnicoid/network238/okio/internal/ResourceFileSystem;->toClasspathRoots(Ljava/lang/ClassLoader;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private final toClasspathRoots(Ljava/lang/ClassLoader;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/kotlin/Pair;",
            ">;"
        }
    .end annotation

    .line 178
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 230
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 239
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :cond_0
    :goto_0
    if-ge v4, v2, :cond_1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    .line 238
    check-cast v5, Ljava/net/URL;

    .line 178
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v5}, Lnicoid/network238/okio/internal/ResourceFileSystem;->toFileRoot(Ljava/net/URL;)Lnicoid/network238/kotlin/Pair;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 238
    invoke-interface {v1, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 179
    :cond_1
    const-string v0, "META-INF/MANIFEST.MF"

    invoke-virtual {p1, v0}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 243
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 252
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :cond_2
    :goto_1
    if-ge v3, v2, :cond_3

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    .line 251
    check-cast v4, Ljava/net/URL;

    .line 179
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v4}, Lnicoid/network238/okio/internal/ResourceFileSystem;->toJarRoot(Ljava/net/URL;)Lnicoid/network238/kotlin/Pair;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 251
    invoke-interface {v0, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 178
    :cond_3
    invoke-static {v1, v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method private final toFileRoot(Ljava/net/URL;)Lnicoid/network238/kotlin/Pair;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            ")",
            "Lnicoid/network238/kotlin/Pair;"
        }
    .end annotation

    .line 183
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 184
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/internal/ResourceFileSystem;->systemFileSystem:Lnicoid/network238/okio/FileSystem;

    sget-object v2, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    new-instance v3, Ljava/io/File;

    invoke-virtual {p1}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object p1

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    const/4 p1, 0x0

    const/4 v4, 0x1

    invoke-static {v2, v3, p1, v4, v1}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/io/File;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object p1

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lnicoid/network238/kotlin/Pair;

    move-result-object p1

    return-object p1
.end method

.method private final toJarRoot(Ljava/net/URL;)Lnicoid/network238/kotlin/Pair;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            ")",
            "Lnicoid/network238/kotlin/Pair;"
        }
    .end annotation

    .line 188
    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 189
    const-string p1, "jar:file:"

    const/4 v6, 0x0

    const/4 v1, 0x2

    const/4 v7, 0x0

    invoke-static {v0, p1, v6, v1, v7}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 193
    :cond_0
    const/4 v4, 0x6

    const/4 v5, 0x0

    const-string v1, "!"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/kotlin/text/StringsKt;->lastIndexOf$default(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    move-result p1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_1

    :goto_0
    return-object v7

    .line 195
    :cond_1
    sget-object v1, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    new-instance v2, Ljava/io/File;

    const/4 v3, 0x4

    invoke-virtual {v0, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    const/4 p1, 0x1

    invoke-static {v1, v2, v6, p1, v7}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/io/File;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object p1

    .line 198
    iget-object v0, p0, Lnicoid/network238/okio/internal/ResourceFileSystem;->systemFileSystem:Lnicoid/network238/okio/FileSystem;

    new-instance v1, Lnicoid/network238/okio/internal/ResourceFileSystem$0;

    invoke-direct {v1}, Lnicoid/network238/okio/internal/ResourceFileSystem$0;-><init>()V

    .line 196
    invoke-static {p1, v0, v1}, Lnicoid/network238/okio/internal/ZipFilesKt;->openZip(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okio/ZipFileSystem;

    move-result-object p1

    .line 201
    sget-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->ROOT:Lnicoid/network238/okio/Path;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lnicoid/network238/kotlin/Pair;

    move-result-object p1

    return-object p1
.end method

.method static final toJarRoot$lambda$0(Lnicoid/network238/okio/internal/ZipEntry;)Z
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 199
    sget-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->Companion:Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

    invoke-virtual {p0}, Lnicoid/network238/okio/internal/ZipEntry;->getCanonicalPath()Lnicoid/network238/okio/Path;

    move-result-object p0

    # invokes: Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->keepPath(Lnicoid/network238/okio/Path;)Z
    invoke-static {v0, p0}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->access$keepPath(Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;Lnicoid/network238/okio/Path;)Z

    move-result p0

    return p0
.end method

.method private final toRelativePath(Lnicoid/network238/okio/Path;)Ljava/lang/String;
    .registers 3

    .line 159
    invoke-direct {p0, p1}, Lnicoid/network238/okio/internal/ResourceFileSystem;->canonicalizeInternal(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;

    move-result-object p1

    .line 160
    sget-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->ROOT:Lnicoid/network238/okio/Path;

    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Path;->relativeTo(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public appendingSink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 143
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " is read-only"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public atomicMove(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " is read-only"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public canonicalize(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    invoke-direct {p0, p1}, Lnicoid/network238/okio/internal/ResourceFileSystem;->canonicalizeInternal(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method

.method public createDirectory(Lnicoid/network238/okio/Path;Z)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " is read-only"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public createSymlink(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 156
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " is read-only"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public delete(Lnicoid/network238/okio/Path;Z)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 153
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " is read-only"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public list(Lnicoid/network238/okio/Path;)Ljava/util/List;
    .registers 14
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

    .line 69
    invoke-direct {p0, p1}, Lnicoid/network238/okio/internal/ResourceFileSystem;->toRelativePath(Lnicoid/network238/okio/Path;)Ljava/lang/String;

    move-result-object v0

    .line 70
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 72
    invoke-direct {p0}, Lnicoid/network238/okio/internal/ResourceFileSystem;->getRoots()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnicoid/network238/kotlin/Pair;

    invoke-virtual {v5}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnicoid/network238/okio/FileSystem;

    invoke-virtual {v5}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnicoid/network238/okio/Path;

    .line 74
    :try_start_0
    invoke-virtual {v5, v0}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object v7

    invoke-virtual {v6, v7}, Lnicoid/network238/okio/FileSystem;->list(Lnicoid/network238/okio/Path;)Ljava/util/List;

    move-result-object v6

    .line 216
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 217
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v9, v8

    check-cast v9, Lnicoid/network238/okio/Path;

    .line 75
    sget-object v10, Lnicoid/network238/okio/internal/ResourceFileSystem;->Companion:Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

    # invokes: Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->keepPath(Lnicoid/network238/okio/Path;)Z
    invoke-static {v10, v9}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->access$keepPath(Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;Lnicoid/network238/okio/Path;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 217
    invoke-interface {v7, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 219
    :cond_1
    new-instance v6, Ljava/util/ArrayList;

    const/16 v8, 0xa

    invoke-static {v7, v8}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v8

    invoke-direct {v6, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 220
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v3

    :goto_2
    if-ge v9, v8, :cond_2

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    .line 221
    check-cast v10, Lnicoid/network238/okio/Path;

    .line 76
    sget-object v11, Lnicoid/network238/okio/internal/ResourceFileSystem;->Companion:Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

    invoke-virtual {v11, v10, v5}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->removeBase(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;

    move-result-object v10

    .line 221
    invoke-interface {v6, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 74
    :cond_2
    invoke-static {v1, v6}, Lnicoid/network238/kotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v4, 0x1

    goto :goto_0

    :catch_0
    move-exception v5

    goto :goto_0

    :cond_3
    if-eqz v4, :cond_4

    .line 82
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 81
    :cond_4
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "file not found: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public listOrNull(Lnicoid/network238/okio/Path;)Ljava/util/List;
    .registers 13
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

    .line 86
    invoke-direct {p0, p1}, Lnicoid/network238/okio/internal/ResourceFileSystem;->toRelativePath(Lnicoid/network238/okio/Path;)Ljava/lang/String;

    move-result-object p1

    .line 87
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 89
    invoke-direct {p0}, Lnicoid/network238/okio/internal/ResourceFileSystem;->getRoots()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnicoid/network238/kotlin/Pair;

    invoke-virtual {v4}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnicoid/network238/okio/FileSystem;

    invoke-virtual {v4}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnicoid/network238/okio/Path;

    .line 90
    invoke-virtual {v4, p1}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object v7

    invoke-virtual {v6, v7}, Lnicoid/network238/okio/FileSystem;->listOrNull(Lnicoid/network238/okio/Path;)Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 223
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 224
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Lnicoid/network238/okio/Path;

    .line 91
    sget-object v9, Lnicoid/network238/okio/internal/ResourceFileSystem;->Companion:Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

    # invokes: Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->keepPath(Lnicoid/network238/okio/Path;)Z
    invoke-static {v9, v8}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->access$keepPath(Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;Lnicoid/network238/okio/Path;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 224
    invoke-interface {v5, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 226
    :cond_2
    new-instance v6, Ljava/util/ArrayList;

    const/16 v7, 0xa

    invoke-static {v5, v7}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 227
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v2

    :goto_2
    if-ge v8, v7, :cond_3

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    .line 228
    check-cast v9, Lnicoid/network238/okio/Path;

    .line 92
    sget-object v10, Lnicoid/network238/okio/internal/ResourceFileSystem;->Companion:Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

    invoke-virtual {v10, v9, v4}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->removeBase(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;

    move-result-object v9

    .line 228
    invoke-interface {v6, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 227
    :cond_3
    move-object v5, v6

    goto :goto_3

    .line 228
    :cond_4
    nop

    :goto_3
    if-eqz v5, :cond_0

    .line 94
    invoke-static {v0, v5}, Lnicoid/network238/kotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    const/4 v3, 0x1

    goto :goto_0

    :cond_5
    if-eqz v3, :cond_6

    .line 98
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_6
    return-object v5
.end method

.method public metadataOrNull(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 118
    sget-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->Companion:Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

    # invokes: Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->keepPath(Lnicoid/network238/okio/Path;)Z
    invoke-static {v0, p1}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->access$keepPath(Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;Lnicoid/network238/okio/Path;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 119
    :cond_0
    invoke-direct {p0, p1}, Lnicoid/network238/okio/internal/ResourceFileSystem;->toRelativePath(Lnicoid/network238/okio/Path;)Ljava/lang/String;

    move-result-object p1

    .line 120
    invoke-direct {p0}, Lnicoid/network238/okio/internal/ResourceFileSystem;->getRoots()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/kotlin/Pair;

    invoke-virtual {v1}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okio/FileSystem;

    invoke-virtual {v1}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okio/Path;

    .line 121
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object v1

    invoke-virtual {v2, v1}, Lnicoid/network238/okio/FileSystem;->metadataOrNull(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;

    move-result-object v1

    if-eqz v1, :cond_1

    return-object v1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public openReadOnly(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileHandle;
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    sget-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->Companion:Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

    # invokes: Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->keepPath(Lnicoid/network238/okio/Path;)Z
    invoke-static {v0, p1}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->access$keepPath(Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;Lnicoid/network238/okio/Path;)Z

    move-result v0

    const-string v1, "file not found: "

    if-eqz v0, :cond_1

    .line 103
    invoke-direct {p0, p1}, Lnicoid/network238/okio/internal/ResourceFileSystem;->toRelativePath(Lnicoid/network238/okio/Path;)Ljava/lang/String;

    move-result-object v0

    .line 104
    invoke-direct {p0}, Lnicoid/network238/okio/internal/ResourceFileSystem;->getRoots()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/kotlin/Pair;

    invoke-virtual {v3}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnicoid/network238/okio/FileSystem;

    invoke-virtual {v3}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okio/Path;

    .line 106
    :try_start_0
    invoke-virtual {v3, v0}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object v3

    invoke-virtual {v4, v3}, Lnicoid/network238/okio/FileSystem;->openReadOnly(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileHandle;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v3

    goto :goto_0

    .line 110
    :cond_0
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 102
    :cond_1
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public openReadWrite(Lnicoid/network238/okio/Path;ZZ)Lnicoid/network238/okio/FileHandle;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    new-instance p1, Ljava/io/IOException;

    const-string p2, "resources are not writable"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public sink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 139
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " is read-only"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public source(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Source;
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    sget-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->Companion:Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;

    # invokes: Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->keepPath(Lnicoid/network238/okio/Path;)Z
    invoke-static {v0, p1}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->access$keepPath(Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;Lnicoid/network238/okio/Path;)Z

    move-result v0

    const-string v1, "file not found: "

    if-eqz v0, :cond_2

    .line 129
    sget-object v0, Lnicoid/network238/okio/internal/ResourceFileSystem;->ROOT:Lnicoid/network238/okio/Path;

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, p1, v4, v2, v3}, Lnicoid/network238/okio/Path;->resolve$default(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object v2

    invoke-virtual {v2, v0}, Lnicoid/network238/okio/Path;->relativeTo(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;

    move-result-object v0

    .line 130
    iget-object v2, p0, Lnicoid/network238/okio/internal/ResourceFileSystem;->classLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v0}, Lnicoid/network238/okio/Path;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 131
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    .line 132
    instance-of v0, p1, Ljava/net/JarURLConnection;

    if-eqz v0, :cond_0

    .line 133
    move-object v0, p1

    check-cast v0, Ljava/net/JarURLConnection;

    invoke-virtual {v0, v4}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 135
    :cond_0
    invoke-virtual {p1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lnicoid/network238/okio/Okio;->source(Ljava/io/InputStream;)Lnicoid/network238/okio/Source;

    move-result-object p1

    return-object p1

    .line 130
    :cond_1
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_2
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
