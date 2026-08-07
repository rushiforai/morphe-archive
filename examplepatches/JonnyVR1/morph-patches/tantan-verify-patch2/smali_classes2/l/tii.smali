.class public final Ll/tii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/uii;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tii$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0000\u0018\u00002\u00020\u0001B\u0013\u0012\n\u0008\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J#\u0010\u000b\u001a\u00020\n2\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00080\u0006H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0016\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/tii;",
        "Ll/uii;",
        "Lcom/clevertap/android/sdk/network/NetworkMonitor;",
        "networkMonitor",
        "<init>",
        "(Lcom/clevertap/android/sdk/network/NetworkMonitor;)V",
        "Lkotlin/Pair;",
        "",
        "Lcom/clevertap/android/sdk/inapp/data/CtCacheType;",
        "urlMeta",
        "Lcom/clevertap/android/sdk/network/DownloadedBitmap;",
        "a",
        "(Lkotlin/Pair;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;",
        "Lcom/clevertap/android/sdk/network/NetworkMonitor;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final a:Lcom/clevertap/android/sdk/network/NetworkMonitor;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 12
    invoke-direct {p0, v0, v1, v0}, Ll/tii;-><init>(Lcom/clevertap/android/sdk/network/NetworkMonitor;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lcom/clevertap/android/sdk/network/NetworkMonitor;)V
    .locals 0
    .param p1    # Lcom/clevertap/android/sdk/network/NetworkMonitor;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Ll/tii;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/network/NetworkMonitor;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1}, Ll/tii;-><init>(Lcom/clevertap/android/sdk/network/NetworkMonitor;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Lkotlin/Pair;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;
    .locals 12
    .param p1    # Lkotlin/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/Pair<",
            "Ljava/lang/String;",
            "+",
            "Lcom/clevertap/android/sdk/inapp/data/CtCacheType;",
            ">;)",
            "Lcom/clevertap/android/sdk/network/DownloadedBitmap;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/tii;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->n()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/clevertap/android/sdk/network/a;->INSTANCE:Lcom/clevertap/android/sdk/network/a;

    .line 17
    .line 18
    sget-object p1, Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;->NO_NETWORK:Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;

    .line 19
    .line 20
    invoke-static {p0, p1, v1, v0, v1}, Lcom/clevertap/android/sdk/network/a;->c(Lcom/clevertap/android/sdk/network/a;Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;Ljava/lang/String;ILjava/lang/Object;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    new-instance v2, Ll/t13;

    .line 26
    .line 27
    invoke-virtual {p1}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    move-object v3, p0

    .line 32
    check-cast v3, Ljava/lang/String;

    .line 33
    .line 34
    const/16 v10, 0x3e

    .line 35
    .line 36
    const/4 v11, 0x0

    .line 37
    const/4 v4, 0x0

    .line 38
    const/4 v5, 0x0

    .line 39
    const/4 v6, 0x0

    .line 40
    const-wide/16 v7, 0x0

    .line 41
    .line 42
    const/4 v9, 0x0

    .line 43
    invoke-direct/range {v2 .. v11}, Ll/t13;-><init>(Ljava/lang/String;ZLandroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;JIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Lcom/clevertap/android/sdk/inapp/data/CtCacheType;

    .line 51
    .line 52
    sget-object p1, Ll/tii$a;->a:[I

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    aget p0, p1, p0

    .line 59
    .line 60
    const/4 p1, 0x1

    .line 61
    if-eq p0, p1, :cond_2

    .line 62
    .line 63
    if-eq p0, v0, :cond_2

    .line 64
    .line 65
    const/4 p1, 0x3

    .line 66
    if-ne p0, p1, :cond_1

    .line 67
    .line 68
    sget-object p0, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$HttpBitmapOperation;->DOWNLOAD_BYTES:Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$HttpBitmapOperation;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    invoke-static {}, Ll/nbr;->a()V

    .line 72
    .line 73
    .line 74
    return-object v1

    .line 75
    :cond_2
    sget-object p0, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$HttpBitmapOperation;->DOWNLOAD_INAPP_BITMAP:Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$HttpBitmapOperation;

    .line 76
    .line 77
    :goto_0
    invoke-static {p0, v2}, Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader;->a(Lcom/clevertap/android/sdk/bitmap/HttpBitmapLoader$HttpBitmapOperation;Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method
