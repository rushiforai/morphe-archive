.class public Ll/wmb0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/rnb0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/p1/mobile/putong/data/Settings;


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

.method public static synthetic e0(Ll/uxj0;)Lrx/c;
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

.method public static synthetic f0(Ll/wmb0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wmb0;->m0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Ll/wmb0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wmb0;->n0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic i0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic m0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rnb0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rnb0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic n0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/wmb0;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

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
    iput-object p1, p0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rnb0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wmb0;->j0(Ll/rnb0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/rmb0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rmb0;-><init>(Ll/wmb0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->j9()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/smb0;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/smb0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/tmb0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/tmb0;-><init>(Ll/wmb0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/wmb0;->l0()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public j0(Ll/rnb0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object p1, p0, Ll/wmb0;->a:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p1, p0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 42
    .line 43
    iget-object v0, p0, Ll/wmb0;->a:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Settings;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_0

    .line 52
    .line 53
    new-instance p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 54
    .line 55
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 56
    .line 57
    .line 58
    new-instance v0, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 59
    .line 60
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserPushSettings;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 64
    .line 65
    iget-object v1, p0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 72
    .line 73
    iget-object v0, p0, Ll/wmb0;->a:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->subtract(Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_0

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ll/wmb0;->o0(Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 92
    .line 93
    .line 94
    :cond_0
    return-void
.end method

.method public l0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rnb0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rnb0;->B()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k8(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/umb0;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/umb0;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/vmb0;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/vmb0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public p0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 8
    .line 9
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p0, Ll/wmb0;->a:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 38
    .line 39
    iget-object v0, p0, Ll/wmb0;->a:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Settings;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_0

    .line 48
    .line 49
    new-instance p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 50
    .line 51
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v0, Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 55
    .line 56
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserLiveSettings;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 60
    .line 61
    iget-object v1, p0, Ll/wmb0;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 70
    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v0, p0, Ll/wmb0;->a:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->subtract(Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_0

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ll/wmb0;->o0(Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 92
    .line 93
    .line 94
    :cond_0
    return-void
.end method

.method public q0(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0, v0}, Ll/wmb0;->r0(Ljava/lang/String;ZII)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public r0(Ljava/lang/String;ZII)V
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
