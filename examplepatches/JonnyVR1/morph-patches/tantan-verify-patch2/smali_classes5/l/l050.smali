.class public Ll/l050;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/x150;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Lcom/p1/mobile/putong/data/Settings;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 5
    .line 6
    iput-object p1, p0, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "e_receive_push_switch"

    .line 2
    .line 3
    const-string v0, "p_set_push_scope_pop"

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

.method public static synthetic f0(Ll/l050;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l050;->q0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic h0(Ll/l050;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l050;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic k0(Ll/l050;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l050;->o0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic l0(Ll/l050;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l050;->p0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic o0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/l050;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->clone()Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p1, Ll/x150;

    .line 18
    .line 19
    iget-object p0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ll/x150;->r0(Lcom/p1/mobile/putong/data/Settings;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic p0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/x150;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/x150;->s0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public A0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    xor-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    iput-boolean p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->conversation:Z

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public C0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    xor-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    iput-boolean p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->extremePick:Z

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public D0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    xor-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    iput-boolean p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->greeting:Z

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public E0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    xor-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    iput-boolean p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->group:Z

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public F0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    xor-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    iput-boolean p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLiked:Z

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public G0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    xor-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    iput-boolean p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->match:Z

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public H0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    xor-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    iput-boolean p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->status:Z

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->j9()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/d050;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/d050;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/e050;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/e050;-><init>(Ll/l050;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/f050;

    .line 46
    .line 47
    invoke-direct {v1}, Ll/f050;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/g050;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/g050;-><init>(Ll/l050;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public m0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public n0()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const-string v0, "p_set_push_scope_pop"

    .line 11
    .line 12
    const-string v1, "NotificationOptPresenter.class"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/th0$a;

    .line 19
    .line 20
    iget-object p0, p0, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    const-string p0, "\u6253\u5f00\u7cfb\u7edf\u63a8\u9001\u5141\u8bb8\u63a5\u6536\u63a2\u63a2\u901a\u77e5\uff0c\u624d\u80fd\u8bbe\u7f6e\u63a5\u6536\u8303\u56f4"

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v1, "\u6253\u5f00\u901a\u77e5"

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v1, Ll/j050;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/j050;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v1, "\u6211\u77e5\u9053\u4e86"

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, v2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v1, Ll/k050;

    .line 57
    .line 58
    invoke-direct {v1, v0}, Ll/k050;-><init>(Ll/l4g0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v1}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 70
    .line 71
    .line 72
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 73
    .line 74
    .line 75
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :cond_0
    return v2
.end method

.method public final synthetic q0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/x150;

    .line 11
    .line 12
    iget-object p0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ll/x150;->r0(Lcom/p1/mobile/putong/data/Settings;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public s0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l050;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 28
    .line 29
    iget-object v1, p0, Ll/l050;->b:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Settings;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 40
    .line 41
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 42
    .line 43
    .line 44
    new-instance v1, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 45
    .line 46
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserPushSettings;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 50
    .line 51
    iget-object v2, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 52
    .line 53
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 58
    .line 59
    iget-object v1, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 68
    .line 69
    iget-object v1, p0, Ll/l050;->b:Lcom/p1/mobile/putong/data/User;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/SettingGroups;->subtract(Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_0

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    sget v3, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 96
    .line 97
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    const/4 v3, 0x1

    .line 102
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 103
    .line 104
    .line 105
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 108
    .line 109
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k8(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/h050;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/h050;-><init>(Ll/l050;)V

    .line 116
    .line 117
    .line 118
    new-instance v2, Ll/i050;

    .line 119
    .line 120
    invoke-direct {v2, p0}, Ll/i050;-><init>(Ll/l050;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 128
    .line 129
    .line 130
    :cond_0
    return-void
.end method

.method public t0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MomentNotifyBlockType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    iput-object p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public u0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MomentNotifyBlockType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    iput-object p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public x0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MomentNotifyBlockType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    iput-object p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public y0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    iput-object p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public z0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/l050;->c:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 30
    .line 31
    xor-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    iput-boolean p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->chatPartners:Z

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l050;->s0()V

    .line 36
    .line 37
    .line 38
    return-void
.end method
