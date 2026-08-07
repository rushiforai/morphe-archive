.class public Ll/sz2;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    new-instance v1, Ll/rz2;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/rz2;-><init>(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Ll/wrv;->n0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/sz2;->d(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/sz2;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1, p2}, Ll/sz2;->f(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-interface {p1}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public static e()Z
    .locals 4

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_5

    .line 9
    .line 10
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 16
    .line 17
    const-string v3, "wechat"

    .line 18
    .line 19
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 26
    .line 27
    const-string v3, "qq"

    .line 28
    .line 29
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_1

    .line 34
    .line 35
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 36
    .line 37
    const-string v3, "network-security"

    .line 38
    .line 39
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    :cond_1
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    return v1

    .line 70
    :cond_2
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 71
    .line 72
    const-string v3, "facebook"

    .line 73
    .line 74
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-nez v2, :cond_3

    .line 79
    .line 80
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 81
    .line 82
    const-string v3, "google"

    .line 83
    .line 84
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-eqz v2, :cond_4

    .line 89
    .line 90
    :cond_3
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 93
    .line 94
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eqz v2, :cond_4

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_4

    .line 113
    .line 114
    return v1

    .line 115
    :cond_4
    const/4 v0, 0x0

    .line 116
    return v0

    .line 117
    :cond_5
    :goto_0
    return v1
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/qz2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/qz2;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H0:I

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Vc:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 40
    .line 41
    .line 42
    return-void
.end method
