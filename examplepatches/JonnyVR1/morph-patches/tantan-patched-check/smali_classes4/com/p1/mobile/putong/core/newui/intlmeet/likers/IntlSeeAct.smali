.class public Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlSeeAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;


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

.method public static X1(Landroid/content/Context;)Landroid/content/Intent;
    .locals 3

    .line 1
    instance-of v0, p0, Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Landroidx/fragment/app/FragmentActivity;

    .line 7
    .line 8
    invoke-static {v0}, Ll/j5j;->b(Landroidx/fragment/app/FragmentActivity;)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "ConversationListFrag"

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const-string v0, "tabMessage"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string v0, "tabMe"

    .line 34
    .line 35
    :goto_0
    new-instance v1, Landroid/content/Intent;

    .line 36
    .line 37
    const-class v2, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlSeeAct;

    .line 38
    .line 39
    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 40
    .line 41
    .line 42
    const-string p0, "from"

    .line 43
    .line 44
    invoke-virtual {v1, p0, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    return-object v1
.end method


# virtual methods
.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    sget v0, Ll/pec0;->O:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const-string v0, "intl_see_act"

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlSeeAct;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    new-instance v1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 27
    .line 28
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlSeeAct;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 32
    .line 33
    new-instance v1, Landroid/os/Bundle;

    .line 34
    .line 35
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlSeeAct;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    sget v2, Ll/ddc0;->l:I

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlSeeAct;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 50
    .line 51
    invoke-virtual {v1, v2, p0, v0}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Landroidx/fragment/app/k;->j()I

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 58
    .line 59
    .line 60
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlSeeAct;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->T4(IILandroid/content/Intent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
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
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

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

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_plm"

    .line 2
    .line 3
    return-object p0
.end method
