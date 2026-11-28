.class public final Lnicoid/network238/okhttp3/HttpUrl$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/HttpUrl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J \u0010\u0008\u001a\u00020\t*\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\n2\n\u0010\u000b\u001a\u00060\u000cj\u0002`\rH\u0002J\u0011\u0010\u000e\u001a\u00020\u000f*\u00020\u0007H\u0007\u00a2\u0006\u0002\u0008\u0010J\u0013\u0010\u0011\u001a\u0004\u0018\u00010\u000f*\u00020\u0007H\u0007\u00a2\u0006\u0002\u0008\u0012J\u0013\u0010\u0011\u001a\u0004\u0018\u00010\u000f*\u00020\u0013H\u0007\u00a2\u0006\u0002\u0008\u0010J\u0013\u0010\u0011\u001a\u0004\u0018\u00010\u000f*\u00020\u0014H\u0007\u00a2\u0006\u0002\u0008\u0010J\u0015\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0015\u001a\u00020\u0007H\u0007\u00a2\u0006\u0002\u0008\u0016J\u0017\u0010\u0012\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0015\u001a\u00020\u0007H\u0007\u00a2\u0006\u0002\u0008\u0017J\u0017\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0015\u001a\u00020\u0013H\u0007\u00a2\u0006\u0002\u0008\u0016J\u0017\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0018\u001a\u00020\u0014H\u0007\u00a2\u0006\u0002\u0008\u0016\u00a8\u0006\u0019"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/HttpUrl$Companion;",
        "",
        "<init>",
        "()V",
        "defaultPort",
        "",
        "scheme",
        "",
        "toQueryString",
        "",
        "",
        "out",
        "Ljava/lang/StringBuilder;",
        "Lnicoid/network238/kotlin/text/StringBuilder;",
        "toHttpUrl",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "get",
        "toHttpUrlOrNull",
        "parse",
        "Ljava/net/URL;",
        "Ljava/net/URI;",
        "url",
        "-deprecated_get",
        "-deprecated_parse",
        "uri",
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

    .line 1710
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/HttpUrl$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$toQueryString(Lnicoid/network238/okhttp3/HttpUrl$Companion;Ljava/util/List;Ljava/lang/StringBuilder;)V
    .registers 3

    .line 1710
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->toQueryString(Ljava/util/List;Ljava/lang/StringBuilder;)V

    return-void
.end method

.method private final toQueryString(Ljava/util/List;Ljava/lang/StringBuilder;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/StringBuilder;",
            ")V"
        }
    .end annotation

    .line 1722
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/ranges/RangesKt;->until(II)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/ranges/RangesKt;->step(Lnicoid/network238/kotlin/ranges/IntProgression;I)Lnicoid/network238/kotlin/ranges/IntProgression;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getFirst()I

    move-result v1

    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v2

    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getStep()I

    move-result v0

    if-lez v0, :cond_0

    if-le v1, v2, :cond_1

    :cond_0
    if-gez v0, :cond_4

    if-gt v2, v1, :cond_4

    .line 1723
    :cond_1
    :goto_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    add-int/lit8 v4, v1, 0x1

    .line 1724
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-lez v1, :cond_2

    .line 1725
    const/16 v5, 0x26

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1726
    :cond_2
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v4, :cond_3

    .line 1728
    const/16 v3, 0x3d

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1729
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    if-eq v1, v2, :cond_4

    add-int/2addr v1, v0

    goto :goto_0

    :cond_4
    return-void
.end method


# virtual methods
.method public final -deprecated_get(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1778
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    return-object p1
.end method

.method public final -deprecated_get(Ljava/net/URI;)Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1814
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->get(Ljava/net/URI;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    return-object p1
.end method

.method public final -deprecated_get(Ljava/net/URL;)Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1802
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->get(Ljava/net/URL;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    return-object p1
.end method

.method public final -deprecated_parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1790
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    return-object p1
.end method

.method public final defaultPort(Ljava/lang/String;)I
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1715
    const-string v0, "http"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, 0x50

    return p1

    .line 1716
    :cond_0
    const-string v0, "https"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 p1, 0x1bb

    return p1

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public final get(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1741
    new-instance v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/HttpUrl$Builder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->parse$okhttp(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->build()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    return-object p1
.end method

.method public final get(Ljava/net/URI;)Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1766
    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    return-object p1
.end method

.method public final get(Ljava/net/URL;)Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1762
    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    return-object p1
.end method

.method public final parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1751
    :try_start_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const/4 p1, 0x0

    return-object p1
.end method
