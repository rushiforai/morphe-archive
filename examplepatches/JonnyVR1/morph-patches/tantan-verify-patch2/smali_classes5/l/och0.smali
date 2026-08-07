.class public Ll/och0;
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

.method public static a()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 4
    .line 5
    iget-object v0, v0, Ll/j7b;->Z:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 13
    .line 14
    iget-object v0, v0, Ll/j7b;->Y:Ll/byd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/byd0;->clear()Z

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 22
    .line 23
    iget-object v0, v0, Ll/j7b;->a0:Ll/jxd0;

    .line 24
    .line 25
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 33
    .line 34
    iget-object v0, v0, Ll/j7b;->b0:Ll/wyd0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 37
    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Af()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SurpriseGift;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_0

    .line 4
    .line 5
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->surpriseGiftType:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "matchUser"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 18
    .line 19
    iget-object v0, v0, Ll/j7b;->Z:Ll/wyd0;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->matchUserId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p0, v0, p1}, Ll/och0;->e(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->surpriseGiftType:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "greetingUser"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 44
    .line 45
    iget-object v0, v0, Ll/j7b;->Z:Ll/wyd0;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    const/4 v0, 0x1

    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->matchUserId:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p0, v0, p1}, Ll/och0;->e(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->surpriseGiftType:Ljava/lang/String;

    .line 58
    .line 59
    const-string v1, "cardExposure"

    .line 60
    .line 61
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const/4 v1, 0x0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 71
    .line 72
    iget-object p1, p1, Ll/j7b;->Y:Ll/byd0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/byd0;->clear()Z

    .line 75
    .line 76
    .line 77
    const/4 p1, 0x3

    .line 78
    invoke-static {p0, p1, v1}, Ll/och0;->e(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->surpriseGiftType:Ljava/lang/String;

    .line 83
    .line 84
    const-string v2, "boost"

    .line 85
    .line 86
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_4

    .line 91
    .line 92
    const/4 p1, 0x2

    .line 93
    invoke-static {p0, p1, v1}, Ll/och0;->e(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V

    .line 94
    .line 95
    .line 96
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 99
    .line 100
    iget-object p0, p0, Ll/j7b;->Y:Ll/byd0;

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/byd0;->clear()Z

    .line 103
    .line 104
    .line 105
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/m27;->V3()Lrx/c;

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->surpriseGiftType:Ljava/lang/String;

    .line 114
    .line 115
    const-string v1, "chatPartners"

    .line 116
    .line 117
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_5

    .line 122
    .line 123
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 126
    .line 127
    iget-object v0, v0, Ll/j7b;->Z:Ll/wyd0;

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 133
    .line 134
    invoke-static {p0, p1}, Ll/och0;->g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartners;)V

    .line 135
    .line 136
    .line 137
    :cond_5
    :goto_0
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Ll/jch0;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/j7b;->p3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/och0$a;

    .line 14
    .line 15
    invoke-direct {v1, p1, p0}, Ll/och0$a;-><init>(Ll/jch0;Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/och0$b;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/och0$b;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static d()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 4
    .line 5
    iget-object v0, v0, Ll/j7b;->Z:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/CharSequence;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 22
    .line 23
    iget-object v0, v0, Ll/j7b;->Z:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 31
    .line 32
    iget-object v0, v0, Ll/j7b;->Y:Ll/byd0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/byd0;->clear()Z

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 40
    .line 41
    iget-object v0, v0, Ll/j7b;->a0:Ll/jxd0;

    .line 42
    .line 43
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 51
    .line 52
    iget-object v0, v0, Ll/j7b;->b0:Ll/wyd0;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 55
    .line 56
    .line 57
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Af()V

    .line 62
    .line 63
    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/j7b;->q3()V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/ybh0$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ybh0$b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/ybh0$b;->a(I)Ll/ybh0$b;

    .line 7
    .line 8
    .line 9
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p1, p2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profile180()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 44
    .line 45
    iget-object v1, v1, Ll/j7b;->b0:Ll/wyd0;

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-interface {p1, p2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {v0, p1}, Ll/ybh0$b;->b(Lcom/p1/mobile/putong/data/User;)Ll/ybh0$b;

    .line 59
    .line 60
    .line 61
    :cond_1
    invoke-virtual {v0, p0}, Ll/ybh0$b;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 4
    .line 5
    iget-object v0, v0, Ll/j7b;->a0:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->B0()V

    .line 24
    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 29
    .line 30
    iget-object p0, p0, Ll/j7b;->a0:Ll/jxd0;

    .line 31
    .line 32
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    invoke-static {}, Ll/pzi0;->o()J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    long-to-double v0, v0

    .line 46
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->lq(D)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartners;)V
    .locals 1

    .line 1
    new-instance v0, Ll/y2g0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/y2g0;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/y2g0;->W(Lcom/p1/mobile/putong/core/data/ChatPartners;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/och0$c;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ll/och0$c;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/y2g0;->V(Ll/x20;)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Ll/och0$d;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ll/och0$d;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
