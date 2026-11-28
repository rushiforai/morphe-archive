.class public final Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;
.super Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u0000 \u000e2\u00020\u0001:\u0001\u000eB\u001b\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0008\u0010\u000c\u001a\u00020\rH\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;",
        "Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;",
        "path",
        "Lnicoid/network238/okio/Path;",
        "fileSystem",
        "Lnicoid/network238/okio/FileSystem;",
        "<init>",
        "(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;)V",
        "getPath",
        "()Lnicoid/network238/okio/Path;",
        "getFileSystem",
        "()Lnicoid/network238/okio/FileSystem;",
        "listSource",
        "Lnicoid/network238/okio/Source;",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList$Companion;

.field public static final PUBLIC_SUFFIX_RESOURCE:Lnicoid/network238/okio/Path;


# instance fields
.field private final fileSystem:Lnicoid/network238/okio/FileSystem;

.field private final path:Lnicoid/network238/okio/Path;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList$Companion;

    .line 32
    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "nicoid/network238/okhttp3/internal/publicsuffix/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-class v3, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".list"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v0, v2, v3, v4, v1}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/lang/String;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;->PUBLIC_SUFFIX_RESOURCE:Lnicoid/network238/okio/Path;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-direct {p0, v0, v0, v1, v0}, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;-><init>(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;-><init>()V

    .line 24
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;->path:Lnicoid/network238/okio/Path;

    .line 25
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;->fileSystem:Lnicoid/network238/okio/FileSystem;

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    .line 24
    sget-object p1, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;->PUBLIC_SUFFIX_RESOURCE:Lnicoid/network238/okio/Path;

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    .line 25
    sget-object p2, Lnicoid/network238/okio/FileSystem;->RESOURCES:Lnicoid/network238/okio/FileSystem;

    .line 23
    :cond_1
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;-><init>(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;)V

    return-void
.end method


# virtual methods
.method public final getFileSystem()Lnicoid/network238/okio/FileSystem;
    .registers 2

    .line 25
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;->fileSystem:Lnicoid/network238/okio/FileSystem;

    return-object v0
.end method

.method public bridge synthetic getPath()Ljava/lang/Object;
    .registers 2

    .line 23
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;->getPath()Lnicoid/network238/okio/Path;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Lnicoid/network238/okio/Path;
    .registers 2

    .line 24
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;->path:Lnicoid/network238/okio/Path;

    return-object v0
.end method

.method public listSource()Lnicoid/network238/okio/Source;
    .registers 3

    .line 27
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;->fileSystem:Lnicoid/network238/okio/FileSystem;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/publicsuffix/ResourcePublicSuffixList;->getPath()Lnicoid/network238/okio/Path;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/FileSystem;->source(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Source;

    move-result-object v0

    return-object v0
.end method
