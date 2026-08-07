.class final Lcom/google/android/gms/internal/ads/zzfm;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/google/android/gms/internal/ads/o1;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/internal/ads/o1;Ll/vbw0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/zzfm;->a:Lcom/google/android/gms/internal/ads/o1;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8

    .line 1
    const-string p2, "connectivity"

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Landroid/net/ConnectivityManager;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x5

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    :try_start_0
    invoke-virtual {p2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    const/4 v2, 0x1

    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-nez v3, :cond_2

    .line 26
    .line 27
    :cond_1
    move v0, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_2
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getType()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const/4 v4, 0x2

    .line 34
    const/16 v5, 0x9

    .line 35
    .line 36
    const/4 v6, 0x6

    .line 37
    const/4 v7, 0x4

    .line 38
    if-eqz v3, :cond_6

    .line 39
    .line 40
    if-eq v3, v2, :cond_5

    .line 41
    .line 42
    if-eq v3, v7, :cond_6

    .line 43
    .line 44
    if-eq v3, v1, :cond_6

    .line 45
    .line 46
    if-eq v3, v6, :cond_4

    .line 47
    .line 48
    if-eq v3, v5, :cond_3

    .line 49
    .line 50
    const/16 v0, 0x8

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    const/4 v0, 0x7

    .line 54
    goto :goto_0

    .line 55
    :cond_4
    :pswitch_0
    move v0, v1

    .line 56
    goto :goto_0

    .line 57
    :cond_5
    :pswitch_1
    move v0, v4

    .line 58
    goto :goto_0

    .line 59
    :cond_6
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    packed-switch p2, :pswitch_data_0

    .line 64
    .line 65
    .line 66
    :pswitch_2
    move v0, v6

    .line 67
    goto :goto_0

    .line 68
    :pswitch_3
    sget p2, Ll/mpw0;->a:I

    .line 69
    .line 70
    const/16 v2, 0x1d

    .line 71
    .line 72
    if-lt p2, v2, :cond_7

    .line 73
    .line 74
    move v0, v5

    .line 75
    goto :goto_0

    .line 76
    :pswitch_4
    move v0, v7

    .line 77
    goto :goto_0

    .line 78
    :pswitch_5
    const/4 v0, 0x3

    .line 79
    :catch_0
    :cond_7
    :goto_0
    sget p2, Ll/mpw0;->a:I

    .line 80
    .line 81
    const/16 v2, 0x1f

    .line 82
    .line 83
    if-lt p2, v2, :cond_9

    .line 84
    .line 85
    if-ne v0, v1, :cond_9

    .line 86
    .line 87
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/zzfm;->a:Lcom/google/android/gms/internal/ads/o1;

    .line 88
    .line 89
    :try_start_1
    const-string p2, "phone"

    .line 90
    .line 91
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    check-cast p2, Landroid/telephony/TelephonyManager;

    .line 96
    .line 97
    if-eqz p2, :cond_8

    .line 98
    .line 99
    new-instance v0, Ll/uaw0;

    .line 100
    .line 101
    invoke-direct {v0, p0}, Ll/uaw0;-><init>(Lcom/google/android/gms/internal/ads/o1;)V

    .line 102
    .line 103
    .line 104
    invoke-static {p1}, Ll/tyq0;->a(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {p2, p1, v0}, Ll/ml20;->a(Landroid/telephony/TelephonyManager;Ljava/util/concurrent/Executor;Landroid/telephony/TelephonyCallback;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p2, v0}, Ll/nl20;->a(Landroid/telephony/TelephonyManager;Landroid/telephony/TelephonyCallback;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_8
    const/4 p1, 0x0

    .line 116
    throw p1
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 117
    :catch_1
    invoke-static {p0, v1}, Lcom/google/android/gms/internal/ads/o1;->c(Lcom/google/android/gms/internal/ads/o1;I)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_9
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/zzfm;->a:Lcom/google/android/gms/internal/ads/o1;

    .line 122
    .line 123
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/ads/o1;->c(Lcom/google/android/gms/internal/ads/o1;I)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
