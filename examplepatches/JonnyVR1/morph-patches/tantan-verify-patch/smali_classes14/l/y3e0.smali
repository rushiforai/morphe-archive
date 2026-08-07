.class public Ll/y3e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic g(Ll/y3e0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y3e0;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "ticketId"

    .line 6
    .line 7
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/ChatAppealCheckData;->new_()Lcom/p1/mobile/putong/data/ChatAppealCheckData;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object p2, v0, Lcom/p1/mobile/putong/data/ChatAppealCheckData;->ticketId:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "jailed"

    .line 32
    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/data/ChatAppealCheckData;->appeal_type:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1, p2}, Ll/esf0;->r(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sget-object p2, Ll/uqb0;->N:Lcom/p1/mobile/putong/api/api/OtherApi;

    .line 43
    .line 44
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/api/api/OtherApi;->userAppealCheck(Lcom/p1/mobile/putong/data/ChatAppealCheckData;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    new-instance v0, Ll/v3e0;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/v3e0;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    new-instance v0, Ll/w3e0;

    .line 62
    .line 63
    invoke-direct {v0, p0, p1}, Ll/w3e0;-><init>(Ll/y3e0;Lcom/p1/mobile/android/app/Act;)V

    .line 64
    .line 65
    .line 66
    new-instance p0, Ll/x3e0;

    .line 67
    .line 68
    invoke-direct {p0}, Ll/x3e0;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public h(Ljava/lang/String;)I
    .locals 0

    .line 1
    const-string p0, "captcha"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const-string p0, "process"

    .line 12
    .line 13
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x2

    .line 20
    return p0

    .line 21
    :cond_1
    const-string p0, "finished"

    .line 22
    .line 23
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 p0, 0x3

    .line 30
    return p0

    .line 31
    :cond_2
    const-string p0, "normal"

    .line 32
    .line 33
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 p0, 0x4

    .line 40
    return p0

    .line 41
    :cond_3
    const-string p0, "failed"

    .line 42
    .line 43
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 p0, 0x5

    .line 50
    return p0

    .line 51
    :cond_4
    const-string p0, "invalid"

    .line 52
    .line 53
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_5

    .line 58
    .line 59
    const/4 p0, 0x6

    .line 60
    return p0

    .line 61
    :cond_5
    const/4 p0, 0x0

    .line 62
    return p0
.end method

.method public final synthetic i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {p0, v0}, Ll/y3e0;->h(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-ne v2, v3, :cond_0

    .line 31
    .line 32
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 33
    .line 34
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    check-cast p2, Lcom/p1/mobile/putong/data/CommonData;

    .line 39
    .line 40
    iget-object p2, p2, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 41
    .line 42
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    iget-object v0, p2, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_4

    .line 55
    .line 56
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    invoke-virtual {p0, p1, p2}, Ll/y3e0;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SliderData;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    const/4 p1, 0x2

    .line 67
    invoke-virtual {p0, v0}, Ll/y3e0;->h(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-ne p1, p2, :cond_1

    .line 72
    .line 73
    sget p0, Lcom/p1/mobile/putong/core/R$string;->q5:I

    .line 74
    .line 75
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    const/4 p1, 0x5

    .line 80
    invoke-virtual {p0, v0}, Ll/y3e0;->h(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-ne p1, p2, :cond_2

    .line 85
    .line 86
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r5:I

    .line 87
    .line 88
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    const/4 p1, 0x4

    .line 93
    invoke-virtual {p0, v0}, Ll/y3e0;->h(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-ne p1, p2, :cond_3

    .line 98
    .line 99
    sget p0, Lcom/p1/mobile/putong/core/R$string;->p5:I

    .line 100
    .line 101
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    const/4 p1, 0x6

    .line 106
    invoke-virtual {p0, v0}, Ll/y3e0;->h(Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-ne p1, p0, :cond_4

    .line 111
    .line 112
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r5:I

    .line 113
    .line 114
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 115
    .line 116
    .line 117
    :cond_4
    return-void
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SliderData;)V
    .locals 7

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string v0, ""

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/u17;->z()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    move-object v2, p0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object v2, v0

    .line 20
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 35
    .line 36
    move-object v3, p0

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move-object v3, v0

    .line 39
    :goto_1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v5, "forbid_chat_appeal"

    .line 44
    .line 45
    const/4 v6, 0x0

    .line 46
    move-object v4, p2

    .line 47
    invoke-virtual/range {v1 .. v6}, Ll/esf0;->m(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SliderData;Ljava/lang/String;Z)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-nez p2, :cond_2

    .line 56
    .line 57
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    invoke-static {p2, v0, p0, v1, v1}, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->n2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p2, "hideNavigationBar"

    .line 65
    .line 66
    invoke-virtual {p0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    const-string p2, "skipLoading"

    .line 70
    .line 71
    invoke-virtual {p0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    return-void
.end method
