.class public final Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;",
        "",
        "<init>",
        "()V",
        "isCacheable",
        "",
        "response",
        "Lnicoid/network238/okhttp3/Response;",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
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

    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final isCacheable(Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)Z
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 304
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 326
    :sswitch_0
    const-string v0, "Expires"

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p1, v0, v2, v1, v2}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 327
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 328
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->isPublic()Z

    move-result v0

    if-nez v0, :cond_0

    .line 329
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->isPrivate()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 342
    :cond_0
    :sswitch_1
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/CacheControl;->noStore()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Request;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/CacheControl;->noStore()Z

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1

    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_1
        0xcb -> :sswitch_1
        0xcc -> :sswitch_1
        0x12c -> :sswitch_1
        0x12d -> :sswitch_1
        0x12e -> :sswitch_0
        0x133 -> :sswitch_0
        0x134 -> :sswitch_1
        0x194 -> :sswitch_1
        0x195 -> :sswitch_1
        0x19a -> :sswitch_1
        0x19e -> :sswitch_1
        0x1f5 -> :sswitch_1
    .end sparse-switch
.end method
