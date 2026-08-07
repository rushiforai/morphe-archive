.class public Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;


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

.method public static X1(Landroid/content/Context;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlSeeAct;->X1(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlSeeAct;->X1(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static Z1(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlSeeAct;->X1(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public finish()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->O4()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget p2, Ll/ddc0;->o:I

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/view/View;->setId(I)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "likers_frag_root"

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    instance-of v2, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 30
    .line 31
    return-object p1

    .line 32
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 33
    .line 34
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 38
    .line 39
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    sget v1, Ll/ddc0;->o:I

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 46
    .line 47
    invoke-virtual {p2, v1, p0, v0}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2}, Landroidx/fragment/app/k;->j()I

    .line 51
    .line 52
    .line 53
    return-object p1
.end method

.method public isAnonymousMode()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public needBindBillingService()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public needRefreshPrivilege()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->D1(IILandroid/content/Intent;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->T4(Landroid/view/Menu;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x102002c

    .line 6
    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->onBackPressed()V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Act;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public onStartLifecycle()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onStartLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    xor-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "is_privileged"

    .line 39
    .line 40
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    filled-new-array {v0}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_see_who_likes_me_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public setTitle(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->U4(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->V4(Ljava/lang/CharSequence;)V

    return-void
.end method
