.class public Ll/rnb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/wmb0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:Ljava/lang/String;

.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VLinear;

.field public c:Lv/VText;

.field public d:Lv/VListCell;

.field public e:Lv/VListCell;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Landroid/view/View;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VListCell;

.field public l:Lv/VListCell;

.field public m:Lv/VListCell;

.field public n:Lv/VLinear;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VListCell;

.field public r:Lv/VLinear;

.field public s:Landroid/view/View;

.field public t:Lv/VText;

.field public u:Lv/VListCell;

.field public v:Lv/VLinear;

.field public w:Lv/VText;

.field public x:Lv/VText;

.field public y:Lcom/p1/mobile/android/app/Act;

.field public z:Ll/wmb0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/rnb0;->A:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/rnb0;->B:Z

    .line 8
    .line 9
    const-string v0, ""

    .line 10
    .line 11
    iput-object v0, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Ll/rnb0;->y:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    return-void
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rnb0;->y:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    iput-boolean v1, p0, Ll/rnb0;->A:Z

    .line 11
    .line 12
    invoke-static {}, Ll/iz40;->A()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, p0, Ll/rnb0;->d:Lv/VListCell;

    .line 17
    .line 18
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const-string v0, "off_on"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string v0, "on_off"

    .line 28
    .line 29
    :goto_0
    const-string v2, "push_switch"

    .line 30
    .line 31
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {v0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v2, "e_push_switch"

    .line 40
    .line 41
    const-string v3, "p_message_push_settings"

    .line 42
    .line 43
    invoke-static {v2, v3, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 47
    .line 48
    const-string v2, "allPushEnable"

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0, v2, v1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    const/4 p1, 0x0

    .line 57
    invoke-virtual {v0, v2, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 58
    .line 59
    .line 60
    :goto_1
    invoke-virtual {p0}, Ll/rnb0;->U()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/qtk;->g:Ljava/util/List;

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, "-"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    sget-object v0, Ll/qtk;->h:Ljava/util/List;

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userPushEndTimeTip()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    add-int/lit8 v1, v1, -0x1

    .line 53
    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string v0, "pushoff_time_setting"

    .line 68
    .line 69
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    filled-new-array {p1}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string v0, "e_pushoff_mode_timesetting"

    .line 78
    .line 79
    const-string v1, "p_message_push_settings"

    .line 80
    .line 81
    invoke-static {v0, v1, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/rnb0;->y:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 89
    .line 90
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 103
    .line 104
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userPushEndTimeTip()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    new-instance v2, Ll/hnb0;

    .line 115
    .line 116
    invoke-direct {v2, p0}, Ll/hnb0;-><init>(Ll/rnb0;)V

    .line 117
    .line 118
    .line 119
    invoke-static {p1, v0, v1, v2}, Ll/qtk;->X0(Lcom/p1/mobile/android/app/Act;IILl/z20;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/rnb0;->e:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string v0, "off_on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "on_off"

    .line 13
    .line 14
    :goto_0
    const-string v1, "push_switch"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_push_detail_switch"

    .line 25
    .line 26
    const-string v2, "p_message_push_settings"

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/wmb0;->k0(Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/rnb0;->k:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string v0, "off2on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "on2off"

    .line 13
    .line 14
    :goto_0
    const-string v1, "push_switch_change"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_friend_message_switch"

    .line 25
    .line 26
    const-string v2, "p_message_push_settings"

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 32
    .line 33
    const-string v0, "msgPush"

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, v0, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const/4 p1, 0x0

    .line 43
    invoke-virtual {p0, v0, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/rnb0;->l:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string v0, "off2on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "on2off"

    .line 13
    .line 14
    :goto_0
    const-string v1, "push_switch_change"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_moment_push_switch"

    .line 25
    .line 26
    const-string v2, "p_message_push_settings"

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 32
    .line 33
    const-string v0, "momentPush"

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, v0, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const/4 p1, 0x0

    .line 43
    invoke-virtual {p0, v0, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/rnb0;->m:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string v0, "off2on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "on2off"

    .line 13
    .line 14
    :goto_0
    const-string v1, "push_switch_change"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_live_push_switch"

    .line 25
    .line 26
    const-string v2, "p_message_push_settings"

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 32
    .line 33
    const-string v0, "livePush"

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, v0, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const/4 p1, 0x0

    .line 43
    invoke-virtual {p0, v0, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_chatroom_setting"

    .line 2
    .line 3
    const-string v0, "p_message_push_settings"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/rnb0;->y:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/rnb0;->X(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/rnb0;->q:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string v0, "off2on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "on2off"

    .line 13
    .line 14
    :goto_0
    const-string v1, "push_switch_change"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_personal_reference_switch"

    .line 25
    .line 26
    const-string v2, "p_message_push_settings"

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 32
    .line 33
    const-string v0, "recommendPush"

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, v0, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const/4 p1, 0x0

    .line 43
    invoke-virtual {p0, v0, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/rnb0;->u:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string v0, "off2on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "on2off"

    .line 13
    .line 14
    :goto_0
    const-string v1, "push_switch_change"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_pushoff_mode_switch"

    .line 25
    .line 26
    const-string v2, "p_message_push_settings"

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/rnb0;->v:Lv/VLinear;

    .line 32
    .line 33
    const-string v1, "silentSwitch"

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 42
    .line 43
    invoke-virtual {p0, v1, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    const/4 p1, 0x0

    .line 48
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 52
    .line 53
    invoke-virtual {p0, v1, p1}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic a(Ll/rnb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnb0;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/rnb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnb0;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/rnb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnb0;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/rnb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnb0;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/rnb0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rnb0;->C(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic f(Ll/rnb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnb0;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ll/rnb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnb0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/rnb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnb0;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/rnb0;Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/rnb0;->S(Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/rnb0;Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/rnb0;->Q(Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/rnb0;Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/rnb0;->R(Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/pej0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Ll/rnb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnb0;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Ll/rnb0;Ll/pej0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rnb0;->T(Ll/pej0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Ll/rnb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnb0;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Ll/rnb0;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rnb0;->O(Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic x(Ll/rnb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnb0;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/rnb0;Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/rnb0;->P(Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Ll/wmb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 2
    .line 3
    return-void
.end method

.method public B()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rnb0;->y:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/ymb0;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/ymb0;-><init>(Ll/rnb0;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rnb0;->W()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic O(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x1

    .line 12
    add-int/2addr v2, v3

    .line 13
    const-string v4, "pushTime"

    .line 14
    .line 15
    invoke-virtual {v0, v4, v3, v1, v2}, Ll/wmb0;->r0(Ljava/lang/String;ZII)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/rnb0;->x:Lv/VText;

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    sget-object v1, Ll/qtk;->g:Ljava/util/List;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, " - "

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    sget-object v2, Ll/qtk;->h:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    new-instance p0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string p1, "-"

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string p1, "pushoff_time_setting"

    .line 108
    .line 109
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    filled-new-array {p0}, [Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const-string p1, "e_pushoff_mode_timesetting"

    .line 118
    .line 119
    const-string p2, "p_message_push_settings"

    .line 120
    .line 121
    invoke-static {p1, p2, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final synthetic P(Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p5, "all"

    .line 2
    .line 3
    iput-object p5, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {p4, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic Q(Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p5, "like"

    .line 2
    .line 3
    iput-object p5, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {p4, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic R(Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p5, "friend"

    .line 2
    .line 3
    iput-object p5, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-static {p3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {p4, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic S(Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p5, "none"

    .line 2
    .line 3
    iput-object p5, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    invoke-static {p4, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic T(Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Ll/wmb0;->p0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/rnb0;->V()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 12
    .line 13
    const-string p2, "friend"

    .line 14
    .line 15
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    const-string p0, "friends"

    .line 22
    .line 23
    :cond_0
    const-string p2, "push_scope"

    .line 24
    .line 25
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {p0}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p2, "e_push_scope_finish"

    .line 34
    .line 35
    const-string v0, "p_push_scope_popup"

    .line 36
    .line 37
    invoke-static {p2, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public U()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rnb0;->d:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/rnb0;->e:Lv/VListCell;

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-boolean v1, p0, Ll/rnb0;->B:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Ll/rnb0;->f:Lv/VLinear;

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Ll/rnb0;->h:Landroid/view/View;

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/rnb0;->s:Landroid/view/View;

    .line 27
    .line 28
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/rnb0;->i:Lv/VLinear;

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/rnb0;->r:Lv/VLinear;

    .line 37
    .line 38
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public V()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "all"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/rnb0;->p:Lv/VText;

    .line 12
    .line 13
    const-string v0, "\u6240\u6709\u4eba"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "like"

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/rnb0;->p:Lv/VText;

    .line 30
    .line 31
    const-string v0, "\u4ec5\u559c\u6b22\u8fc7\u7684\u4eba"

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object v0, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 38
    .line 39
    const-string v1, "friend"

    .line 40
    .line 41
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Ll/rnb0;->p:Lv/VText;

    .line 48
    .line 49
    const-string v0, "\u4ec5\u597d\u53cb"

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    iget-object v0, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 56
    .line 57
    const-string v1, "none"

    .line 58
    .line 59
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    iget-object p0, p0, Ll/rnb0;->p:Lv/VText;

    .line 66
    .line 67
    const-string v0, "\u4e0d\u63a5\u6536"

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    return-void
.end method

.method public W()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/rnb0;->A:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/rnb0;->A:Z

    .line 7
    .line 8
    iget-object v1, p0, Ll/rnb0;->d:Lv/VListCell;

    .line 9
    .line 10
    invoke-static {v1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    const-string v2, "off_on"

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string v2, "on_off"

    .line 20
    .line 21
    :goto_0
    const-string v3, "push_switch"

    .line 22
    .line 23
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    filled-new-array {v2}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string v3, "e_push_switch"

    .line 32
    .line 33
    const-string v4, "p_message_push_settings"

    .line 34
    .line 35
    invoke-static {v3, v4, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Ll/rnb0;->z:Ll/wmb0;

    .line 39
    .line 40
    const-string v3, "allPushEnable"

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    invoke-virtual {v2, v3, v0}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    invoke-virtual {v2, v3, v0}, Ll/wmb0;->q0(Ljava/lang/String;Z)V

    .line 50
    .line 51
    .line 52
    :cond_2
    :goto_1
    invoke-virtual {p0}, Ll/rnb0;->U()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public X(Lcom/p1/mobile/android/app/Act;)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v2, "p_push_scope_popup"

    .line 10
    .line 11
    invoke-static {v2, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    const-string v0, "push_setting_source"

    .line 16
    .line 17
    const-string v2, "chatroom"

    .line 18
    .line 19
    invoke-static {v0, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v6, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    new-instance v7, Ll/pej0;

    .line 31
    .line 32
    move-object/from16 v0, p1

    .line 33
    .line 34
    invoke-direct {v7, v0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-virtual {v7, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 39
    .line 40
    .line 41
    sget v2, Ll/kec0;->kb:I

    .line 42
    .line 43
    invoke-virtual {v7, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 44
    .line 45
    .line 46
    sget v2, Ll/adc0;->r4:I

    .line 47
    .line 48
    invoke-virtual {v7, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    move-object v8, v2

    .line 53
    check-cast v8, Lv/VIcon;

    .line 54
    .line 55
    sget v2, Ll/adc0;->q4:I

    .line 56
    .line 57
    invoke-virtual {v7, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Landroid/widget/TextView;

    .line 62
    .line 63
    sget v3, Ll/adc0;->s4:I

    .line 64
    .line 65
    invoke-virtual {v7, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    move-object v9, v3

    .line 70
    check-cast v9, Landroid/widget/TextView;

    .line 71
    .line 72
    sget v3, Ll/adc0;->j1:I

    .line 73
    .line 74
    invoke-virtual {v7, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    move-object v10, v3

    .line 79
    check-cast v10, Lv/VRelative;

    .line 80
    .line 81
    sget v3, Ll/adc0;->p1:I

    .line 82
    .line 83
    invoke-virtual {v7, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    move-object v11, v3

    .line 88
    check-cast v11, Lv/VRelative;

    .line 89
    .line 90
    sget v3, Ll/adc0;->n1:I

    .line 91
    .line 92
    invoke-virtual {v7, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    move-object v12, v3

    .line 97
    check-cast v12, Lv/VRelative;

    .line 98
    .line 99
    sget v3, Ll/adc0;->l1:I

    .line 100
    .line 101
    invoke-virtual {v7, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    move-object v13, v3

    .line 106
    check-cast v13, Lv/VRelative;

    .line 107
    .line 108
    sget v3, Ll/adc0;->C:I

    .line 109
    .line 110
    invoke-virtual {v7, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    check-cast v3, Lv/VImage;

    .line 115
    .line 116
    sget v4, Ll/adc0;->e9:I

    .line 117
    .line 118
    invoke-virtual {v7, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    check-cast v4, Lv/VImage;

    .line 123
    .line 124
    sget v5, Ll/adc0;->C4:I

    .line 125
    .line 126
    invoke-virtual {v7, v5}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    check-cast v5, Lv/VImage;

    .line 131
    .line 132
    sget v14, Ll/adc0;->D1:I

    .line 133
    .line 134
    invoke-virtual {v7, v14}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v14

    .line 138
    check-cast v14, Lv/VImage;

    .line 139
    .line 140
    sget v15, Ll/adc0;->k1:I

    .line 141
    .line 142
    invoke-virtual {v7, v15}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v15

    .line 146
    check-cast v15, Lv/VText;

    .line 147
    .line 148
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 149
    .line 150
    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 151
    .line 152
    .line 153
    sget v15, Ll/adc0;->q1:I

    .line 154
    .line 155
    invoke-virtual {v7, v15}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v15

    .line 159
    check-cast v15, Lv/VText;

    .line 160
    .line 161
    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 162
    .line 163
    .line 164
    sget v15, Ll/adc0;->o1:I

    .line 165
    .line 166
    invoke-virtual {v7, v15}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v15

    .line 170
    check-cast v15, Lv/VText;

    .line 171
    .line 172
    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 173
    .line 174
    .line 175
    sget v15, Ll/adc0;->m1:I

    .line 176
    .line 177
    invoke-virtual {v7, v15}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v15

    .line 181
    check-cast v15, Lv/VText;

    .line 182
    .line 183
    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 190
    .line 191
    .line 192
    iget-object v0, v1, Ll/rnb0;->z:Ll/wmb0;

    .line 193
    .line 194
    iget-object v0, v0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 195
    .line 196
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 201
    .line 202
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 203
    .line 204
    iput-object v0, v1, Ll/rnb0;->C:Ljava/lang/String;

    .line 205
    .line 206
    const-string v2, "all"

    .line 207
    .line 208
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-eqz v0, :cond_0

    .line 213
    .line 214
    const/4 v0, 0x1

    .line 215
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 216
    .line 217
    .line 218
    goto :goto_0

    .line 219
    :cond_0
    const/4 v0, 0x1

    .line 220
    iget-object v2, v1, Ll/rnb0;->C:Ljava/lang/String;

    .line 221
    .line 222
    const-string v15, "like"

    .line 223
    .line 224
    invoke-static {v2, v15}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    if-eqz v2, :cond_1

    .line 229
    .line 230
    invoke-static {v4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 231
    .line 232
    .line 233
    goto :goto_0

    .line 234
    :cond_1
    iget-object v2, v1, Ll/rnb0;->C:Ljava/lang/String;

    .line 235
    .line 236
    const-string v15, "friend"

    .line 237
    .line 238
    invoke-static {v2, v15}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    if-eqz v2, :cond_2

    .line 243
    .line 244
    invoke-static {v5, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 245
    .line 246
    .line 247
    goto :goto_0

    .line 248
    :cond_2
    iget-object v2, v1, Ll/rnb0;->C:Ljava/lang/String;

    .line 249
    .line 250
    const-string v15, "none"

    .line 251
    .line 252
    invoke-static {v2, v15}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    if-eqz v2, :cond_3

    .line 257
    .line 258
    invoke-static {v14, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 259
    .line 260
    .line 261
    :cond_3
    :goto_0
    new-instance v0, Ll/zmb0;

    .line 262
    .line 263
    move-object v2, v3

    .line 264
    move-object v3, v4

    .line 265
    move-object v4, v5

    .line 266
    move-object v5, v14

    .line 267
    invoke-direct/range {v0 .. v5}, Ll/zmb0;-><init>(Ll/rnb0;Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;)V

    .line 268
    .line 269
    .line 270
    invoke-static {v10, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 271
    .line 272
    .line 273
    new-instance v0, Ll/anb0;

    .line 274
    .line 275
    move-object/from16 v1, p0

    .line 276
    .line 277
    invoke-direct/range {v0 .. v5}, Ll/anb0;-><init>(Ll/rnb0;Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;)V

    .line 278
    .line 279
    .line 280
    invoke-static {v11, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 281
    .line 282
    .line 283
    new-instance v0, Ll/bnb0;

    .line 284
    .line 285
    invoke-direct/range {v0 .. v5}, Ll/bnb0;-><init>(Ll/rnb0;Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;)V

    .line 286
    .line 287
    .line 288
    invoke-static {v12, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 289
    .line 290
    .line 291
    new-instance v0, Ll/cnb0;

    .line 292
    .line 293
    invoke-direct/range {v0 .. v5}, Ll/cnb0;-><init>(Ll/rnb0;Lv/VImage;Lv/VImage;Lv/VImage;Lv/VImage;)V

    .line 294
    .line 295
    .line 296
    invoke-static {v13, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 297
    .line 298
    .line 299
    new-instance v0, Ll/dnb0;

    .line 300
    .line 301
    invoke-direct {v0, v7}, Ll/dnb0;-><init>(Ll/pej0;)V

    .line 302
    .line 303
    .line 304
    invoke-static {v8, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 305
    .line 306
    .line 307
    new-instance v0, Ll/enb0;

    .line 308
    .line 309
    invoke-direct {v0, v1, v7}, Ll/enb0;-><init>(Ll/rnb0;Ll/pej0;)V

    .line 310
    .line 311
    .line 312
    invoke-static {v9, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 313
    .line 314
    .line 315
    new-instance v0, Ll/fnb0;

    .line 316
    .line 317
    invoke-direct {v0, v6}, Ll/fnb0;-><init>(Ll/l4g0;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v7, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 321
    .line 322
    .line 323
    new-instance v0, Ll/gnb0;

    .line 324
    .line 325
    invoke-direct {v0, v6}, Ll/gnb0;-><init>(Ll/l4g0;)V

    .line 326
    .line 327
    .line 328
    invoke-virtual {v7, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v7}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    const v1, 0x3e99999a    # 0.3f

    .line 336
    .line 337
    .line 338
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    .line 339
    .line 340
    .line 341
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    if-eqz v1, :cond_4

    .line 346
    .line 347
    const v1, 0x1020002

    .line 348
    .line 349
    .line 350
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    sget v1, Ll/adc0;->q2:I

    .line 355
    .line 356
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    check-cast v0, Landroid/widget/FrameLayout;

    .line 361
    .line 362
    sget v1, Ll/dbc0;->Up:I

    .line 363
    .line 364
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 365
    .line 366
    .line 367
    :cond_4
    invoke-virtual {v7}, Landroid/app/Dialog;->show()V

    .line 368
    .line 369
    .line 370
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wmb0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rnb0;->A(Ll/wmb0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rnb0;->z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rnb0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "\u6d88\u606f\u901a\u77e5\u8bbe\u7f6e"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/rnb0;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/xmb0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/xmb0;-><init>(Ll/rnb0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/rnb0;->k:Lv/VListCell;

    .line 19
    .line 20
    const/4 v1, 0x5

    .line 21
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/rnb0;->l:Lv/VListCell;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/rnb0;->m:Lv/VListCell;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/rnb0;->q:Lv/VListCell;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/rnb0;->u:Lv/VListCell;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/rnb0;->k:Lv/VListCell;

    .line 45
    .line 46
    const/16 v1, 0xd

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lv/VListCell;->setSubTitleSize(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/rnb0;->l:Lv/VListCell;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lv/VListCell;->setSubTitleSize(I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/rnb0;->m:Lv/VListCell;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lv/VListCell;->setSubTitleSize(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/rnb0;->u:Lv/VListCell;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lv/VListCell;->setSubTitleSize(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/rnb0;->q:Lv/VListCell;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lv/VListCell;->setSubTitleSize(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/rnb0;->d:Lv/VListCell;

    .line 72
    .line 73
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleTypeface(Landroid/graphics/Typeface;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/rnb0;->e:Lv/VListCell;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleTypeface(Landroid/graphics/Typeface;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/rnb0;->k:Lv/VListCell;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleTypeface(Landroid/graphics/Typeface;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/rnb0;->l:Lv/VListCell;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleTypeface(Landroid/graphics/Typeface;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/rnb0;->m:Lv/VListCell;

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleTypeface(Landroid/graphics/Typeface;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/rnb0;->q:Lv/VListCell;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleTypeface(Landroid/graphics/Typeface;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/rnb0;->u:Lv/VListCell;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleTypeface(Landroid/graphics/Typeface;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/rnb0;->o:Lv/VText;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/rnb0;->w:Lv/VText;

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/rnb0;->c:Lv/VText;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/rnb0;->t:Lv/VText;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/rnb0;->j:Lv/VText;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/rnb0;->g:Lv/VText;

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/rnb0;->d:Lv/VListCell;

    .line 139
    .line 140
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 141
    .line 142
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 143
    .line 144
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getUserPushAllEnable()Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Ll/rnb0;->e:Lv/VListCell;

    .line 156
    .line 157
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 158
    .line 159
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 160
    .line 161
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 166
    .line 167
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Ll/rnb0;->k:Lv/VListCell;

    .line 179
    .line 180
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 181
    .line 182
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 183
    .line 184
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 189
    .line 190
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userMsgPushTip()Ljava/lang/Boolean;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Ll/rnb0;->l:Lv/VListCell;

    .line 202
    .line 203
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 204
    .line 205
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 206
    .line 207
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 212
    .line 213
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userMomentPushTip()Ljava/lang/Boolean;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Ll/rnb0;->m:Lv/VListCell;

    .line 225
    .line 226
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 227
    .line 228
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 229
    .line 230
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 235
    .line 236
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userLivePushTip()Ljava/lang/Boolean;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 245
    .line 246
    .line 247
    iget-object v0, p0, Ll/rnb0;->q:Lv/VListCell;

    .line 248
    .line 249
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 250
    .line 251
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 252
    .line 253
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 258
    .line 259
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userRecommendPushTip()Ljava/lang/Boolean;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 268
    .line 269
    .line 270
    iget-object v0, p0, Ll/rnb0;->u:Lv/VListCell;

    .line 271
    .line 272
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 273
    .line 274
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 275
    .line 276
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 281
    .line 282
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userSilentSwitchPushTip()Ljava/lang/Boolean;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 291
    .line 292
    .line 293
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 294
    .line 295
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 296
    .line 297
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 302
    .line 303
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->uservoiceNotification()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    iput-object v0, p0, Ll/rnb0;->C:Ljava/lang/String;

    .line 308
    .line 309
    invoke-virtual {p0}, Ll/rnb0;->V()V

    .line 310
    .line 311
    .line 312
    const-string v0, "e_push_switch"

    .line 313
    .line 314
    const-string v1, "p_message_push_settings"

    .line 315
    .line 316
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    iget-object v0, p0, Ll/rnb0;->d:Lv/VListCell;

    .line 320
    .line 321
    new-instance v2, Ll/inb0;

    .line 322
    .line 323
    invoke-direct {v2, p0}, Ll/inb0;-><init>(Ll/rnb0;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 327
    .line 328
    .line 329
    const-string v0, "e_push_detail_switch"

    .line 330
    .line 331
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    iget-object v0, p0, Ll/rnb0;->e:Lv/VListCell;

    .line 335
    .line 336
    new-instance v2, Ll/jnb0;

    .line 337
    .line 338
    invoke-direct {v2, p0}, Ll/jnb0;-><init>(Ll/rnb0;)V

    .line 339
    .line 340
    .line 341
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 342
    .line 343
    .line 344
    const/4 v0, 0x0

    .line 345
    iput-boolean v0, p0, Ll/rnb0;->B:Z

    .line 346
    .line 347
    iget-object v2, p0, Ll/rnb0;->f:Lv/VLinear;

    .line 348
    .line 349
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 350
    .line 351
    .line 352
    const-string v0, "e_friend_message_switch"

    .line 353
    .line 354
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    iget-object v0, p0, Ll/rnb0;->k:Lv/VListCell;

    .line 358
    .line 359
    new-instance v2, Ll/knb0;

    .line 360
    .line 361
    invoke-direct {v2, p0}, Ll/knb0;-><init>(Ll/rnb0;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 365
    .line 366
    .line 367
    const-string v0, "e_moment_push_switch"

    .line 368
    .line 369
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    iget-object v0, p0, Ll/rnb0;->l:Lv/VListCell;

    .line 373
    .line 374
    new-instance v2, Ll/lnb0;

    .line 375
    .line 376
    invoke-direct {v2, p0}, Ll/lnb0;-><init>(Ll/rnb0;)V

    .line 377
    .line 378
    .line 379
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 380
    .line 381
    .line 382
    const-string v0, "e_live_push_switch"

    .line 383
    .line 384
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    iget-object v0, p0, Ll/rnb0;->m:Lv/VListCell;

    .line 388
    .line 389
    new-instance v2, Ll/mnb0;

    .line 390
    .line 391
    invoke-direct {v2, p0}, Ll/mnb0;-><init>(Ll/rnb0;)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 395
    .line 396
    .line 397
    const-string v0, "e_chatroom_setting"

    .line 398
    .line 399
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    iget-object v0, p0, Ll/rnb0;->n:Lv/VLinear;

    .line 403
    .line 404
    new-instance v2, Ll/nnb0;

    .line 405
    .line 406
    invoke-direct {v2, p0}, Ll/nnb0;-><init>(Ll/rnb0;)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {v0, v2}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 410
    .line 411
    .line 412
    const-string v0, "e_personal_reference_switch"

    .line 413
    .line 414
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    .line 416
    .line 417
    iget-object v0, p0, Ll/rnb0;->q:Lv/VListCell;

    .line 418
    .line 419
    new-instance v2, Ll/onb0;

    .line 420
    .line 421
    invoke-direct {v2, p0}, Ll/onb0;-><init>(Ll/rnb0;)V

    .line 422
    .line 423
    .line 424
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 425
    .line 426
    .line 427
    const-string v0, "e_pushoff_mode_switch"

    .line 428
    .line 429
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    .line 431
    .line 432
    iget-object v0, p0, Ll/rnb0;->u:Lv/VListCell;

    .line 433
    .line 434
    new-instance v1, Ll/pnb0;

    .line 435
    .line 436
    invoke-direct {v1, p0}, Ll/pnb0;-><init>(Ll/rnb0;)V

    .line 437
    .line 438
    .line 439
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 440
    .line 441
    .line 442
    iget-object v0, p0, Ll/rnb0;->v:Lv/VLinear;

    .line 443
    .line 444
    new-instance v1, Ll/qnb0;

    .line 445
    .line 446
    invoke-direct {v1, p0}, Ll/qnb0;-><init>(Ll/rnb0;)V

    .line 447
    .line 448
    .line 449
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 450
    .line 451
    .line 452
    iget-object v0, p0, Ll/rnb0;->v:Lv/VLinear;

    .line 453
    .line 454
    iget-object v1, p0, Ll/rnb0;->u:Lv/VListCell;

    .line 455
    .line 456
    invoke-static {v1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 457
    .line 458
    .line 459
    move-result v1

    .line 460
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 461
    .line 462
    .line 463
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 464
    .line 465
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 466
    .line 467
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 472
    .line 473
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 474
    .line 475
    .line 476
    move-result v0

    .line 477
    if-ltz v0, :cond_2

    .line 478
    .line 479
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 480
    .line 481
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 482
    .line 483
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 484
    .line 485
    .line 486
    move-result-object v0

    .line 487
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 488
    .line 489
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 490
    .line 491
    .line 492
    move-result v0

    .line 493
    const/16 v1, 0x17

    .line 494
    .line 495
    if-le v0, v1, :cond_0

    .line 496
    .line 497
    goto :goto_0

    .line 498
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 499
    .line 500
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 501
    .line 502
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 503
    .line 504
    .line 505
    move-result-object v0

    .line 506
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 507
    .line 508
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->userPushEndTimeTip()I

    .line 509
    .line 510
    .line 511
    move-result v0

    .line 512
    const/4 v1, 0x1

    .line 513
    if-lt v0, v1, :cond_2

    .line 514
    .line 515
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 516
    .line 517
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 518
    .line 519
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 520
    .line 521
    .line 522
    move-result-object v0

    .line 523
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 524
    .line 525
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 526
    .line 527
    .line 528
    move-result v0

    .line 529
    const/16 v2, 0x18

    .line 530
    .line 531
    if-le v0, v2, :cond_1

    .line 532
    .line 533
    goto :goto_0

    .line 534
    :cond_1
    iget-object v0, p0, Ll/rnb0;->x:Lv/VText;

    .line 535
    .line 536
    new-instance v2, Ljava/lang/StringBuilder;

    .line 537
    .line 538
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 539
    .line 540
    .line 541
    sget-object v3, Ll/qtk;->g:Ljava/util/List;

    .line 542
    .line 543
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 544
    .line 545
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 546
    .line 547
    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 548
    .line 549
    .line 550
    move-result-object v4

    .line 551
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 552
    .line 553
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 554
    .line 555
    .line 556
    move-result v4

    .line 557
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 558
    .line 559
    .line 560
    move-result-object v3

    .line 561
    check-cast v3, Ljava/lang/String;

    .line 562
    .line 563
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 564
    .line 565
    .line 566
    const-string v3, " - "

    .line 567
    .line 568
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    sget-object v3, Ll/qtk;->h:Ljava/util/List;

    .line 572
    .line 573
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 574
    .line 575
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 576
    .line 577
    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 578
    .line 579
    .line 580
    move-result-object v4

    .line 581
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 582
    .line 583
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->userPushEndTimeTip()I

    .line 584
    .line 585
    .line 586
    move-result v4

    .line 587
    sub-int/2addr v4, v1

    .line 588
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 589
    .line 590
    .line 591
    move-result-object v1

    .line 592
    check-cast v1, Ljava/lang/String;

    .line 593
    .line 594
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v1

    .line 601
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 602
    .line 603
    .line 604
    invoke-virtual {p0}, Ll/rnb0;->U()V

    .line 605
    .line 606
    .line 607
    :cond_2
    :goto_0
    return-void
.end method

.method public z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/snb0;->b(Ll/rnb0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
