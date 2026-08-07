.class public Ll/by40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/px40;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VLinear;

.field public c:Lv/VListCell;

.field public d:Lv/VLinear;

.field public e:Lv/VListCell;

.field public f:Lv/VListCell;

.field public g:Lv/VListCell;

.field public h:Lv/VListCell;

.field public i:Lv/VListCell;

.field public j:Lv/VLinear;

.field public k:Landroid/view/View;

.field public l:Lv/VListCell;

.field public m:Lv/VLinear;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lcom/p1/mobile/android/app/Act;

.field public q:Ll/px40;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/by40;->p:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method private synthetic A(Landroid/view/View;)V
    .locals 2

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
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/iz40;->A()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p1, p0, Ll/by40;->l:Lv/VListCell;

    .line 14
    .line 15
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/by40;->l:Lv/VListCell;

    .line 19
    .line 20
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object v0, p0, Ll/by40;->m:Lv/VLinear;

    .line 25
    .line 26
    const-string v1, "silentSwitch"

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/by40;->q:Ll/px40;

    .line 35
    .line 36
    invoke-virtual {p0, v1, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    const/4 p1, 0x0

    .line 41
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/by40;->q:Ll/px40;

    .line 45
    .line 46
    invoke-virtual {p0, v1, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "e_pushoff_mode_timesetting"

    .line 2
    .line 3
    const-string v0, "p_push_setting"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/by40;->p:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userPushEndTimeTip()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    new-instance v2, Ll/rx40;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/rx40;-><init>(Ll/by40;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v0, v1, v2}, Ll/qtk;->X0(Lcom/p1/mobile/android/app/Act;IILl/z20;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic a(Ll/by40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/by40;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/by40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/by40;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/by40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/by40;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/by40;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/by40;->B(Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic e(Ll/by40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/by40;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/by40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/by40;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/by40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/by40;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/by40;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/by40;->s(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic k(Ll/by40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/by40;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/by40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/by40;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "e_receive_push_switch"

    .line 2
    .line 3
    const-string v0, "p_push_setting"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/iz40;->A()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/by40;->p:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/by40;->e:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/by40;->e:Lv/VListCell;

    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p0, p0, Ll/by40;->q:Ll/px40;

    .line 13
    .line 14
    const-string v0, "msgPush"

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, v0, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, v0, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/by40;->f:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/by40;->f:Lv/VListCell;

    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p0, p0, Ll/by40;->q:Ll/px40;

    .line 13
    .line 14
    const-string v0, "momentPush"

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, v0, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, v0, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/by40;->g:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/by40;->g:Lv/VListCell;

    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p0, p0, Ll/by40;->q:Ll/px40;

    .line 13
    .line 14
    const-string v0, "livePush"

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, v0, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, v0, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/by40;->h:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/by40;->h:Lv/VListCell;

    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p0, p0, Ll/by40;->q:Ll/px40;

    .line 13
    .line 14
    const-string v0, "voiceLivePush"

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, v0, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, v0, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/by40;->i:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/by40;->i:Lv/VListCell;

    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p0, p0, Ll/by40;->q:Ll/px40;

    .line 13
    .line 14
    const-string v0, "recommendPush"

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, v0, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, v0, p1}, Ll/px40;->i0(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final synthetic B(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/by40;->q:Ll/px40;

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
    invoke-virtual {v0, v4, v3, v1, v2}, Ll/px40;->j0(Ljava/lang/String;ZII)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/by40;->o:Lv/VText;

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
    const-string p2, "p_push_setting"

    .line 120
    .line 121
    invoke-static {p1, p2, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 122
    .line 123
    .line 124
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

.method public E()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->opened:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    iget-object v2, p0, Ll/by40;->b:Lv/VLinear;

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    const/4 v4, 0x0

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/by40;->d:Lv/VLinear;

    .line 17
    .line 18
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/by40;->l:Lv/VListCell;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userSilentSwitchPushTip()Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/by40;->m:Lv/VLinear;

    .line 45
    .line 46
    iget-object v1, p0, Ll/by40;->l:Lv/VListCell;

    .line 47
    .line 48
    invoke-static {v1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v4}, Ll/by40;->F(Z)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/by40;->m:Lv/VLinear;

    .line 63
    .line 64
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/by40;->d:Lv/VLinear;

    .line 68
    .line 69
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/by40;->l:Lv/VListCell;

    .line 73
    .line 74
    invoke-static {v0, v4}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v3}, Ll/by40;->F(Z)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public F(Z)V
    .locals 0

    .line 1
    const-string p0, "p_push_setting"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "e_receive_push_switch"

    .line 6
    .line 7
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p1, "e_friend_message_switch"

    .line 12
    .line 13
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p1, "e_moment_push_switch"

    .line 17
    .line 18
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p1, "e_live_push_switch"

    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p1, "e_personal_reference_switch"

    .line 27
    .line 28
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p1, "e_chatroom_switch"

    .line 32
    .line 33
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    const-string p1, "e_pushoff_mode_switch"

    .line 37
    .line 38
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
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
    check-cast p1, Ll/px40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/by40;->p(Ll/px40;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/by40;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cy40;->b(Ll/by40;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ll/px40;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/by40;->q:Ll/px40;

    .line 2
    .line 3
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/by40;->p:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/qx40;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/qx40;-><init>(Ll/by40;)V

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

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/by40;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "\u901a\u77e5\u8bbe\u7f6e"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/by40;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/sx40;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/sx40;-><init>(Ll/by40;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/by40;->e:Lv/VListCell;

    .line 19
    .line 20
    const/4 v1, 0x3

    .line 21
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/by40;->f:Lv/VListCell;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/by40;->g:Lv/VListCell;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/by40;->h:Lv/VListCell;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/by40;->i:Lv/VListCell;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/by40;->l:Lv/VListCell;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitleBottomPadding(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/by40;->e:Lv/VListCell;

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userMsgPushTip()Ljava/lang/Boolean;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/by40;->f:Lv/VListCell;

    .line 73
    .line 74
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 77
    .line 78
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userMomentPushTip()Ljava/lang/Boolean;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/by40;->g:Lv/VListCell;

    .line 96
    .line 97
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 100
    .line 101
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userLivePushTip()Ljava/lang/Boolean;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/by40;->h:Lv/VListCell;

    .line 119
    .line 120
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 123
    .line 124
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userVoiceLivePushTip()Ljava/lang/Boolean;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/by40;->i:Lv/VListCell;

    .line 142
    .line 143
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 144
    .line 145
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 146
    .line 147
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->userRecommendPushTip()Ljava/lang/Boolean;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ll/by40;->c:Lv/VListCell;

    .line 165
    .line 166
    new-instance v1, Ll/tx40;

    .line 167
    .line 168
    invoke-direct {v1}, Ll/tx40;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/by40;->e:Lv/VListCell;

    .line 175
    .line 176
    new-instance v1, Ll/ux40;

    .line 177
    .line 178
    invoke-direct {v1, p0}, Ll/ux40;-><init>(Ll/by40;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Ll/by40;->f:Lv/VListCell;

    .line 185
    .line 186
    new-instance v1, Ll/vx40;

    .line 187
    .line 188
    invoke-direct {v1, p0}, Ll/vx40;-><init>(Ll/by40;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Ll/by40;->g:Lv/VListCell;

    .line 195
    .line 196
    new-instance v1, Ll/wx40;

    .line 197
    .line 198
    invoke-direct {v1, p0}, Ll/wx40;-><init>(Ll/by40;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Ll/by40;->h:Lv/VListCell;

    .line 205
    .line 206
    new-instance v1, Ll/xx40;

    .line 207
    .line 208
    invoke-direct {v1, p0}, Ll/xx40;-><init>(Ll/by40;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Ll/by40;->i:Lv/VListCell;

    .line 215
    .line 216
    new-instance v1, Ll/yx40;

    .line 217
    .line 218
    invoke-direct {v1, p0}, Ll/yx40;-><init>(Ll/by40;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Ll/by40;->l:Lv/VListCell;

    .line 225
    .line 226
    new-instance v1, Ll/zx40;

    .line 227
    .line 228
    invoke-direct {v1, p0}, Ll/zx40;-><init>(Ll/by40;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Ll/by40;->m:Lv/VLinear;

    .line 235
    .line 236
    new-instance v1, Ll/ay40;

    .line 237
    .line 238
    invoke-direct {v1, p0}, Ll/ay40;-><init>(Ll/by40;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ll/by40;->m:Lv/VLinear;

    .line 245
    .line 246
    iget-object v1, p0, Ll/by40;->l:Lv/VListCell;

    .line 247
    .line 248
    invoke-static {v1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 253
    .line 254
    .line 255
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 256
    .line 257
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 258
    .line 259
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 264
    .line 265
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    if-ltz v0, :cond_2

    .line 270
    .line 271
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 272
    .line 273
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 274
    .line 275
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 280
    .line 281
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    const/16 v1, 0x17

    .line 286
    .line 287
    if-le v0, v1, :cond_0

    .line 288
    .line 289
    goto :goto_0

    .line 290
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 291
    .line 292
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 293
    .line 294
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 299
    .line 300
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->userPushEndTimeTip()I

    .line 301
    .line 302
    .line 303
    move-result v0

    .line 304
    const/4 v1, 0x1

    .line 305
    if-lt v0, v1, :cond_2

    .line 306
    .line 307
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 308
    .line 309
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 310
    .line 311
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 316
    .line 317
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    const/16 v2, 0x18

    .line 322
    .line 323
    if-le v0, v2, :cond_1

    .line 324
    .line 325
    goto :goto_0

    .line 326
    :cond_1
    iget-object p0, p0, Ll/by40;->o:Lv/VText;

    .line 327
    .line 328
    new-instance v0, Ljava/lang/StringBuilder;

    .line 329
    .line 330
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 331
    .line 332
    .line 333
    sget-object v2, Ll/qtk;->g:Ljava/util/List;

    .line 334
    .line 335
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 336
    .line 337
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 338
    .line 339
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 340
    .line 341
    .line 342
    move-result-object v3

    .line 343
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 344
    .line 345
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Settings;->userPushStartTimeTip()I

    .line 346
    .line 347
    .line 348
    move-result v3

    .line 349
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v2

    .line 353
    check-cast v2, Ljava/lang/String;

    .line 354
    .line 355
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    const-string v2, " - "

    .line 359
    .line 360
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    sget-object v2, Ll/qtk;->h:Ljava/util/List;

    .line 364
    .line 365
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 366
    .line 367
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 368
    .line 369
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 374
    .line 375
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Settings;->userPushEndTimeTip()I

    .line 376
    .line 377
    .line 378
    move-result v3

    .line 379
    sub-int/2addr v3, v1

    .line 380
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    check-cast v1, Ljava/lang/String;

    .line 385
    .line 386
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 394
    .line 395
    .line 396
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/by40;->E()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
