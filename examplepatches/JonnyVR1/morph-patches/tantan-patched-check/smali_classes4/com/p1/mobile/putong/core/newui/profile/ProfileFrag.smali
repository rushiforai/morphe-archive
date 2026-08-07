.class public Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;
.super Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;
.source "SourceFile"


# instance fields
.field public B:Ll/u1b0;

.field public C:Ll/v1b0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/hix;->a(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)Ll/u1b0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->B:Ll/u1b0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/hix;->b(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)Ll/v1b0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->C:Ll/v1b0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public C4()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "+",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->C:Ll/v1b0;

    .line 7
    .line 8
    instance-of v1, p0, Ll/f920;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast p0, Ll/f920;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/f920;->B()Ljava/util/Collection;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-object v0
.end method

.method public S4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->S4()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 34
    .line 35
    const-string v1, "online"

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 44
    .line 45
    const-string v0, "grey"

    .line 46
    .line 47
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-static {}, Ll/g4a;->d()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/dkb;->Z9()Lrx/c;

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public d4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->B:Ll/u1b0;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->C:Ll/v1b0;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->B:Ll/u1b0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ar2;->a0()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/ml70;->b()Ll/ml70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ll/ml70;->d(Lcom/p1/mobile/android/app/Act;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->C:Ll/v1b0;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/v1b0;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->MyTabInflate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->C:Ll/v1b0;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ll/iam;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->C:Ll/v1b0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v1b0;->o()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->B:Ll/u1b0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Ll/u1b0;->e0(IILandroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->U4()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->C:Ll/v1b0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/v1b0;->D1()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->C:Ll/v1b0;

    .line 16
    .line 17
    invoke-interface {v0}, Ll/v1b0;->x1()V

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->B:Ll/u1b0;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/u1b0;->g0(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->C:Ll/v1b0;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/v1b0;->x2()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->B:Ll/u1b0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/u1b0;->f0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->B:Ll/u1b0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->B:Ll/u1b0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/u1b0;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "p_navigation_view"

    .line 17
    .line 18
    return-object p0
.end method
