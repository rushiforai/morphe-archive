.class public final Ll/oev0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/piu0;

.field public final c:Ljava/util/concurrent/Executor;

.field public final d:Ll/p6w0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/piu0;Ll/p6w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oev0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p3, p0, Ll/oev0;->b:Ll/piu0;

    .line 7
    .line 8
    iput-object p2, p0, Ll/oev0;->c:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    iput-object p4, p0, Ll/oev0;->d:Ll/p6w0;

    .line 11
    .line 12
    return-void
.end method

.method public static d(Ll/q6w0;)Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 2
    .line 3
    const-string v0, "tab_url"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final a(Ll/b7w0;Ll/q6w0;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oev0;->a:Landroid/content/Context;

    .line 2
    .line 3
    instance-of p1, p0, Landroid/app/Activity;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/bis0;->g(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {p2}, Ll/oev0;->d(Ll/q6w0;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;)Ll/hpr;
    .locals 3

    .line 1
    invoke-static {p2}, Ll/oev0;->d(Ll/q6w0;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object v0, v1

    .line 14
    :goto_0
    invoke-static {v1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Ll/mev0;

    .line 19
    .line 20
    invoke-direct {v2, p0, v0, p1, p2}, Ll/mev0;-><init>(Ll/oev0;Landroid/net/Uri;Ll/b7w0;Ll/q6w0;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/oev0;->c:Ljava/util/concurrent/Executor;

    .line 24
    .line 25
    invoke-static {v1, v2, p0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final synthetic c(Landroid/net/Uri;Ll/b7w0;Ll/q6w0;Ljava/lang/Object;)Ll/hpr;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance p4, Ll/vzb$a;

    .line 2
    .line 3
    invoke-direct {p4}, Ll/vzb$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p4}, Ll/vzb$a;->a()Ll/vzb;

    .line 7
    .line 8
    .line 9
    move-result-object p4

    .line 10
    iget-object v0, p4, Ll/vzb;->a:Landroid/content/Intent;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    new-instance v2, Lcom/google/android/gms/ads/internal/overlay/zzc;

    .line 16
    .line 17
    iget-object p1, p4, Ll/vzb;->a:Landroid/content/Intent;

    .line 18
    .line 19
    const/4 p4, 0x0

    .line 20
    invoke-direct {v2, p1, p4}, Lcom/google/android/gms/ads/internal/overlay/zzc;-><init>(Landroid/content/Intent;Ll/v4z0;)V

    .line 21
    .line 22
    .line 23
    new-instance p1, Ll/tct0;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/tct0;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/oev0;->b:Ll/piu0;

    .line 29
    .line 30
    new-instance v1, Ll/a0u0;

    .line 31
    .line 32
    invoke-direct {v1, p2, p3, p4}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    new-instance p2, Ll/lhu0;

    .line 36
    .line 37
    new-instance p3, Ll/nev0;

    .line 38
    .line 39
    invoke-direct {p3, p1}, Ll/nev0;-><init>(Ll/tct0;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p2, p3, p4}, Ll/lhu0;-><init>(Ll/wiu0;Ll/wit0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1, p2}, Ll/piu0;->c(Ll/a0u0;Ll/lhu0;)Ll/ihu0;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    new-instance v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 50
    .line 51
    invoke-virtual {p2}, Ll/ihu0;->h()Ll/i9u0;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    new-instance v5, Lcom/google/android/gms/internal/ads/zzcei;

    .line 56
    .line 57
    const/4 v9, 0x0

    .line 58
    const/4 v10, 0x0

    .line 59
    const/4 v6, 0x0

    .line 60
    const/4 v7, 0x0

    .line 61
    const/4 v8, 0x0

    .line 62
    invoke-direct/range {v5 .. v10}, Lcom/google/android/gms/internal/ads/zzcei;-><init>(IIZZZ)V

    .line 63
    .line 64
    .line 65
    const/4 v7, 0x0

    .line 66
    const/4 v8, 0x0

    .line 67
    const/4 v3, 0x0

    .line 68
    move-object v6, v5

    .line 69
    const/4 v5, 0x0

    .line 70
    invoke-direct/range {v1 .. v8}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/overlay/zzc;Ll/har0;Ll/joy0;Ll/rar0;Lcom/google/android/gms/internal/ads/zzcei;Ll/wit0;Ll/ggu0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v1}, Ll/tct0;->b(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Ll/oev0;->d:Ll/p6w0;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/p6w0;->a()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2}, Ll/ihu0;->i()Ll/hhu0;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 86
    .line 87
    .line 88
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    return-object p0

    .line 90
    :catchall_0
    move-exception v0

    .line 91
    move-object p0, v0

    .line 92
    const-string p1, "Error in CustomTabsAdRenderer"

    .line 93
    .line 94
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 95
    .line 96
    .line 97
    throw p0
.end method
