.class public Lcom/p1/mobile/putong/core/ui/likedusers/LikedUsersAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;


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


# virtual methods
.method public disableAutoPV()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vf()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
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
    sget p2, Ll/ddc0;->n:I

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
    const-string v0, "liked_users_frag_root"

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    instance-of v2, v1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    check-cast v1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUsersAct;->c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 30
    .line 31
    return-object p1

    .line 32
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 33
    .line 34
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUsersAct;->c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 38
    .line 39
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    sget v1, Ll/ddc0;->n:I

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUsersAct;->c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

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

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUsersAct;->c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->S4()Ll/fjr;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1, p2, p3}, Ll/fjr;->c1(IILandroid/content/Intent;)Z

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

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_who_i_liked"

    .line 2
    .line 3
    return-object p0
.end method
