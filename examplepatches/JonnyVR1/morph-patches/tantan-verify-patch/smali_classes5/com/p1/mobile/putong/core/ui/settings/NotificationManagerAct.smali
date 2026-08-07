.class public Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lv/VFrame;

.field public d:Lv/VText;

.field public e:Lv/VLinear;

.field public f:Lv/VLinear;

.field public g:Lv/VLinear;

.field public h:Lv/VLinear;

.field public i:Lv/VLinear;

.field public j:Lv/VLinear;

.field public k:Lv/VLinear;

.field public l:Lv/VLinear;

.field public m:Lv/VLinear;

.field public n:Lcom/p1/mobile/putong/data/SettingGroups;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->m2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->h2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n2(Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->o2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->i2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->k2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->l2(Landroid/view/View;)V

    return-void
.end method

.method private synthetic h2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->e:Lv/VLinear;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->p2()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic i2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->f:Lv/VLinear;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->p2()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public e2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/b050;->b(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final g2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->e:Lv/VLinear;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->f:Lv/VLinear;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->g:Lv/VLinear;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ll/ytk;->c()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->i:Lv/VLinear;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserFakeSettings;->weeklyReportPush:Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->j:Lv/VLinear;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserFakeSettings;->dailyReportPush:Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->k:Lv/VLinear;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    invoke-static {v0, p0}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 95
    .line 96
    .line 97
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->e2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/uz40;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/uz40;-><init>(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic k2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->g:Lv/VLinear;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->p2()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic l2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->k:Lv/VLinear;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->p2()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic m2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dkb;->R:Ll/gyd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/SettingGroups;->clone()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->g2()V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->e:Lv/VLinear;

    .line 23
    .line 24
    new-instance v0, Ll/vz40;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/vz40;-><init>(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->f:Lv/VLinear;

    .line 33
    .line 34
    new-instance v0, Ll/wz40;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/wz40;-><init>(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->g:Lv/VLinear;

    .line 43
    .line 44
    new-instance v0, Ll/xz40;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/xz40;-><init>(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/ytk;->c()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->k:Lv/VLinear;

    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->k:Lv/VLinear;

    .line 65
    .line 66
    new-instance v0, Ll/yz40;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/yz40;-><init>(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public final synthetic n2(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->g2()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic o2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dkb;->R:Ll/gyd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/SettingGroups;->clone()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->g2()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final p2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->n:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/dkb;->A9(Lcom/p1/mobile/putong/data/UserPushSettings;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/zz40;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/zz40;-><init>(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/a050;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/a050;-><init>(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_pushmanagement_view"

    .line 2
    .line 3
    return-object p0
.end method
