.class public Ll/px40;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/by40;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/px40;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/px40;->g0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic g0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/by40;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/by40;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/ox40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ox40;-><init>(Ll/px40;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/px40;->f0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/by40;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/by40;->q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h0(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    const-string p0, "msgPush"

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
    const-string p0, "e_friend_message_switch"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "momentPush"

    .line 13
    .line 14
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-string p0, "e_moment_push_switch"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string p0, "livePush"

    .line 24
    .line 25
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "e_live_push_switch"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string p0, "voiceLivePush"

    .line 35
    .line 36
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    const-string p0, "e_chatroom_switch"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    const-string p0, "recommendPush"

    .line 46
    .line 47
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    const-string p0, "e_personal_reference_switch"

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_4
    const-string p0, "silentSwitch"

    .line 57
    .line 58
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_5

    .line 63
    .line 64
    const-string p0, "e_pushoff_mode_switch"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_5
    const-string p0, ""

    .line 68
    .line 69
    :goto_0
    if-eqz p2, :cond_6

    .line 70
    .line 71
    const-string p1, "off2on"

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_6
    const-string p1, "on2off"

    .line 75
    .line 76
    :goto_1
    const-string p2, "push_switch_change"

    .line 77
    .line 78
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    filled-new-array {p1}, [Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const-string p2, "p_push_setting"

    .line 87
    .line 88
    invoke-static {p0, p2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public i0(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/px40;->h0(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, p1, p2, v0, v0}, Ll/px40;->j0(Ljava/lang/String;ZII)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public j0(Ljava/lang/String;ZII)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/dkb;->K9(Ljava/lang/String;ZII)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Ll/psd0;->L(Ll/bb50;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method
