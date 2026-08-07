.class public final Ll/l5r0;
.super Ljava/lang/Object;


# direct methods
.method public static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l5r0;->d(Landroid/content/Context;)Lcom/apm/lite/j/e$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/l5r0;->b(Lcom/apm/lite/j/e$b;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static b(Lcom/apm/lite/j/e$b;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Ll/l5r0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :pswitch_0
    const-string p0, "5g"

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_1
    const-string p0, "mobile"

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_2
    const-string p0, "4g"

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_3
    const-string p0, "3g"

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_4
    const-string p0, "2g"

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_5
    const-string p0, "wifi"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    return-object p0

    .line 31
    :catch_0
    :goto_0
    const-string p0, ""

    .line 32
    .line 33
    return-object p0

    .line 34
    nop

    .line 35
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static c(Landroid/content/Context;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "connectivity"

    .line 3
    .line 4
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/net/ConnectivityManager;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isAvailable()Z

    .line 20
    .line 21
    .line 22
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :catch_0
    :cond_1
    return v0
.end method

.method private static d(Landroid/content/Context;)Lcom/apm/lite/j/e$b;
    .locals 2

    .line 1
    :try_start_0
    const-string v0, "connectivity"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_6

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x1

    .line 30
    if-ne v1, v0, :cond_2

    .line 31
    .line 32
    sget-object p0, Lcom/apm/lite/j/e$b;->e:Lcom/apm/lite/j/e$b;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    if-nez v0, :cond_5

    .line 36
    .line 37
    const-string v0, "phone"

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const/4 v0, 0x3

    .line 50
    if-eq p0, v0, :cond_4

    .line 51
    .line 52
    const/16 v0, 0x14

    .line 53
    .line 54
    if-eq p0, v0, :cond_3

    .line 55
    .line 56
    const/4 v0, 0x5

    .line 57
    if-eq p0, v0, :cond_4

    .line 58
    .line 59
    const/4 v0, 0x6

    .line 60
    if-eq p0, v0, :cond_4

    .line 61
    .line 62
    packed-switch p0, :pswitch_data_0

    .line 63
    .line 64
    .line 65
    packed-switch p0, :pswitch_data_1

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :pswitch_0
    sget-object p0, Lcom/apm/lite/j/e$b;->f:Lcom/apm/lite/j/e$b;

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_3
    sget-object p0, Lcom/apm/lite/j/e$b;->g:Lcom/apm/lite/j/e$b;

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_4
    :pswitch_1
    sget-object p0, Lcom/apm/lite/j/e$b;->d:Lcom/apm/lite/j/e$b;

    .line 76
    .line 77
    return-object p0

    .line 78
    :cond_5
    :goto_0
    sget-object p0, Lcom/apm/lite/j/e$b;->b:Lcom/apm/lite/j/e$b;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_6
    :goto_1
    sget-object p0, Lcom/apm/lite/j/e$b;->a:Lcom/apm/lite/j/e$b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .line 83
    return-object p0

    .line 84
    :catchall_0
    sget-object p0, Lcom/apm/lite/j/e$b;->b:Lcom/apm/lite/j/e$b;

    .line 85
    .line 86
    return-object p0

    .line 87
    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    :pswitch_data_1
    .packed-switch 0xc
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
