.class public Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;
.super Lcom/p1/mobile/putong/core/ui/profile/ProfileMediaAct;
.source "SourceFile"


# instance fields
.field public c:Ll/u4x;

.field public d:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileMediaAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->lambda$initSubscription$0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static Z1(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "jump_show_tab"

    .line 9
    .line 10
    const-string v1, "editTab"

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "marry_jump_marry"

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method private synthetic lambda$initSubscription$0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->c:Ll/u4x;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/u4x;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->d:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 10
    .line 11
    new-instance v0, Ll/u4x;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/u4x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->c:Ll/u4x;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->d:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->d:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->Z()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->d:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a0()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/j4x;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/j4x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x1389

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    if-ne p2, p1, :cond_1

    .line 10
    .line 11
    const-string p1, "loop_edit_user"

    .line 12
    .line 13
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->d:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->C0(Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const/16 v0, 0x312

    .line 32
    .line 33
    if-ne p1, v0, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->d:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->y0(IILandroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->d:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->m0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onCropImageResult(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Act;->onCropImageResult(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->d:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->z0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->c:Ll/u4x;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/u4x;->j:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->d:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->D0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/AutoReleaseVideoAct;->onDestroyLifecycle()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->c:Ll/u4x;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->c:Ll/u4x;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/u4x;->u(Landroid/os/Bundle;)V

    .line 15
    .line 16
    .line 17
    const-string p0, "saveInstanceKey"

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-virtual {p1, p0, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_marriage_profile_edit"

    .line 2
    .line 3
    return-object p0
.end method
