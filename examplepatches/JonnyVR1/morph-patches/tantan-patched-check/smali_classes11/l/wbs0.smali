.class public final synthetic Ll/wbs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zbs0;

.field public final synthetic b:Ll/rbs0;

.field public final synthetic c:Lcom/google/android/gms/internal/ads/zzbbb;

.field public final synthetic d:Ll/tct0;


# direct methods
.method public synthetic constructor <init>(Ll/zbs0;Ll/rbs0;Lcom/google/android/gms/internal/ads/zzbbb;Ll/tct0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wbs0;->a:Ll/zbs0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wbs0;->b:Ll/rbs0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/wbs0;->c:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 9
    .line 10
    iput-object p4, p0, Ll/wbs0;->d:Ll/tct0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v1, p0, Ll/wbs0;->a:Ll/zbs0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/wbs0;->b:Ll/rbs0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/wbs0;->d:Ll/tct0;

    .line 6
    .line 7
    :try_start_0
    invoke-virtual {v0}, Ll/rbs0;->d()Ll/tbs0;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {v0}, Ll/rbs0;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    iget-object p0, p0, Ll/wbs0;->c:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    :try_start_1
    invoke-virtual {v3, p0}, Ll/tbs0;->M6(Lcom/google/android/gms/internal/ads/zzbbb;)Lcom/google/android/gms/internal/ads/zzbay;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    goto :goto_1

    .line 24
    :catch_0
    move-exception v0

    .line 25
    :goto_0
    move-object p0, v0

    .line 26
    goto :goto_2

    .line 27
    :catch_1
    move-exception v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {v3, p0}, Ll/tbs0;->m5(Lcom/google/android/gms/internal/ads/zzbbb;)Lcom/google/android/gms/internal/ads/zzbay;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzbay;->zze()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    new-instance p0, Ljava/lang/RuntimeException;

    .line 40
    .line 41
    const-string v0, "No entry contents."

    .line 42
    .line 43
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, p0}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 47
    .line 48
    .line 49
    iget-object p0, v1, Ll/zbs0;->c:Ll/bcs0;

    .line 50
    .line 51
    invoke-static {p0}, Ll/bcs0;->e(Ll/bcs0;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    new-instance v3, Ll/ybs0;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzbay;->I()Ljava/io/InputStream;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/4 v4, 0x1

    .line 62
    invoke-direct {v3, v1, v0, v4}, Ll/ybs0;-><init>(Ll/zbs0;Ljava/io/InputStream;I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/io/PushbackInputStream;->read()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const/4 v4, -0x1

    .line 70
    if-eq v0, v4, :cond_2

    .line 71
    .line 72
    invoke-virtual {v3, v0}, Ljava/io/PushbackInputStream;->unread(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzbay;->zzd()Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzbay;->h0()Z

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzbay;->F()J

    .line 84
    .line 85
    .line 86
    move-result-wide v6

    .line 87
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzbay;->J()Z

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    invoke-static/range {v3 .. v8}, Ll/dcs0;->b(Ljava/io/InputStream;ZZJZ)Ll/dcs0;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v2, p0}, Ll/tct0;->b(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    new-instance p0, Ljava/io/IOException;

    .line 100
    .line 101
    const-string v0, "Unable to read from cache."

    .line 102
    .line 103
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    throw p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 107
    :goto_2
    const-string v0, "Unable to obtain a cache service instance."

    .line 108
    .line 109
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2, p0}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 113
    .line 114
    .line 115
    iget-object p0, v1, Ll/zbs0;->c:Ll/bcs0;

    .line 116
    .line 117
    invoke-static {p0}, Ll/bcs0;->e(Ll/bcs0;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method
