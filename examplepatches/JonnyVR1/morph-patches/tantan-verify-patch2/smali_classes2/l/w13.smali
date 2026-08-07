.class public final Ll/w13;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lpl;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0017\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0006\u001a\u00020\u0005H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tR\u0014\u0010\u0002\u001a\u00020\u00018\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0008\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Ll/w13;",
        "Ll/lpl;",
        "iBitmapDownloadRequestHandler",
        "<init>",
        "(Ll/lpl;)V",
        "Ll/t13;",
        "bitmapDownloadRequest",
        "Lcom/clevertap/android/sdk/network/DownloadedBitmap;",
        "a",
        "(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;",
        "Ll/lpl;",
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
.field private final a:Ll/lpl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/lpl;)V
    .locals 0
    .param p1    # Ll/lpl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/w13;->a:Ll/lpl;

    .line 8
    .line 9
    return-void
.end method

.method public static b(Ll/w13;Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/w13;->a:Ll/lpl;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/lpl;->a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;
    .locals 7
    .param p1    # Ll/t13;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "handling bitmap download request in BitmapDownloadRequestHandlerWithTimeLimit...."

    .line 5
    .line 6
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Ll/t13;->b()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1}, Ll/t13;->c()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1}, Ll/t13;->d()Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {p1}, Ll/t13;->e()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    const-wide/16 v5, -0x1

    .line 28
    .line 29
    cmp-long v5, v3, v5

    .line 30
    .line 31
    if-nez v5, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-static {v2}, Ll/ru3;->c(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Ll/su3;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Ll/su3;->a()Lcom/clevertap/android/sdk/task/Task;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    new-instance v5, Ll/v13;

    .line 46
    .line 47
    invoke-direct {v5, p0, p1}, Ll/v13;-><init>(Ll/w13;Ll/t13;)V

    .line 48
    .line 49
    .line 50
    const-string p0, "getNotificationBitmap"

    .line 51
    .line 52
    invoke-virtual {v2, p0, v5, v3, v4}, Lcom/clevertap/android/sdk/task/Task;->o(Ljava/lang/String;Ljava/util/concurrent/Callable;J)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 57
    .line 58
    if-nez p0, :cond_1

    .line 59
    .line 60
    const-string p0, "Task timeout or executor framework error"

    .line 61
    .line 62
    invoke-static {p0}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    sget-object p1, Lcom/clevertap/android/sdk/network/a;->INSTANCE:Lcom/clevertap/android/sdk/network/a;

    .line 66
    .line 67
    sget-object v2, Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;->DOWNLOAD_FAILED:Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;

    .line 68
    .line 69
    invoke-virtual {p1, v2, p0}, Lcom/clevertap/android/sdk/network/a;->b(Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;Ljava/lang/String;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    :cond_1
    invoke-static {v0, v1, p0}, Lcom/clevertap/android/sdk/Utils;->m(ZLandroid/content/Context;Lcom/clevertap/android/sdk/network/DownloadedBitmap;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_2
    :goto_0
    const-string v0, "either config is null or downloadTimeLimitInMillis is negative."

    .line 82
    .line 83
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    const-string v0, "will download bitmap without time limit"

    .line 87
    .line 88
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/w13;->a:Ll/lpl;

    .line 92
    .line 93
    invoke-interface {p0, p1}, Ll/lpl;->a(Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0
.end method
