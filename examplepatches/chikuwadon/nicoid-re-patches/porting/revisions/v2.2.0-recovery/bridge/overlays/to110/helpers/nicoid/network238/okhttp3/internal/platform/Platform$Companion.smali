.class public final Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/platform/Platform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0012\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u000c\u001a\u00020\u0005H\u0007J\u0010\u0010\r\u001a\u00020\u000e2\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005J\u001a\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u00102\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u0010J\u0008\u0010\u0017\u001a\u00020\u0005H\u0002J\u0014\u0010\u0018\u001a\u00020\u00192\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u0010R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u0016\u0010\t\u001a\n \u000b*\u0004\u0018\u00010\n0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0014\u001a\u00020\u00158F\u00a2\u0006\u0006\u001a\u0004\u0008\u0014\u0010\u0016\u00a8\u0006\u001a"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;",
        "",
        "<init>",
        "()V",
        "platform",
        "Lnicoid/network238/okhttp3/internal/platform/Platform;",
        "INFO",
        "",
        "WARN",
        "logger",
        "Ljava/util/logging/Logger;",
        "nicoid.network238.kotlin.jvm.PlatformType",
        "get",
        "resetForTests",
        "",
        "alpnProtocolNames",
        "",
        "",
        "protocols",
        "Lnicoid/network238/okhttp3/Protocol;",
        "isAndroid",
        "",
        "()Z",
        "findPlatform",
        "concatLengthPrefixed",
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
.method private constructor <init>()V
    .registers 1

    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$findPlatform(Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;)Lnicoid/network238/okhttp3/internal/platform/Platform;
    .registers 1

    .line 230
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->findPlatform()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object p0

    return-object p0
.end method

.method private final findPlatform()Lnicoid/network238/okhttp3/internal/platform/Platform;
    .registers 2

    .line 252
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;->INSTANCE:Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;->findPlatform()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic resetForTests$default(Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;Lnicoid/network238/okhttp3/internal/platform/Platform;ILjava/lang/Object;)V
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 241
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->findPlatform()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object p1

    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->resetForTests(Lnicoid/network238/okhttp3/internal/platform/Platform;)V

    return-void
.end method


# virtual methods
.method public final alpnProtocolNames(Ljava/util/List;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 269
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 270
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lnicoid/network238/okhttp3/Protocol;

    .line 246
    sget-object v3, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_0:Lnicoid/network238/okhttp3/Protocol;

    if-eq v2, v3, :cond_0

    .line 270
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 272
    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 273
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    .line 274
    check-cast v3, Lnicoid/network238/okhttp3/Protocol;

    .line 246
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Protocol;->toString()Ljava/lang/String;

    move-result-object v3

    .line 274
    invoke-interface {p1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    return-object p1
.end method

.method public final concatLengthPrefixed(Ljava/util/List;)[B
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;)[B"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 259
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 260
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->alpnProtocolNames(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 261
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 262
    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    goto :goto_0

    .line 264
    :cond_0
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readByteArray()[B

    move-result-object p1

    return-object p1
.end method

.method public final get()Lnicoid/network238/okhttp3/internal/platform/Platform;
    .registers 2

    .line 239
    # getter for: Lnicoid/network238/okhttp3/internal/platform/Platform;->platform:Lnicoid/network238/okhttp3/internal/platform/Platform;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/platform/Platform;->access$getPlatform$cp()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    return-object v0
.end method

.method public final isAndroid()Z
    .registers 2

    .line 249
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;->INSTANCE:Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;->isAndroid()Z

    move-result v0

    return v0
.end method

.method public final resetForTests(Lnicoid/network238/okhttp3/internal/platform/Platform;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 242
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->access$setPlatform$cp(Lnicoid/network238/okhttp3/internal/platform/Platform;)V

    .line 243
    sget-object p1, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;->resetForTests$okhttp()V

    return-void
.end method
