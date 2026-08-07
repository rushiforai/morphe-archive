.class public Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/report/f$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Lcom/p1/mobile/putong/core/ui/report/d;",
        "Lcom/p1/mobile/putong/core/ui/report/e;",
        ">;",
        "Lcom/p1/mobile/putong/core/ui/report/f$b;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/t0d0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/t0d0;-><init>(Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/u0d0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/u0d0;-><init>(Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;->T4()V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;->S4(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic S4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/report/f;->b()Lcom/p1/mobile/putong/core/ui/report/f;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/report/f;->g(Lcom/p1/mobile/putong/core/ui/report/f$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic T4()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/report/f;->b()Lcom/p1/mobile/putong/core/ui/report/f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/report/f;->h(Lcom/p1/mobile/putong/core/ui/report/f$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static U4(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/report/ReportCategory;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    invoke-direct {v1, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 10
    .line 11
    .line 12
    const-string v2, "user_id"

    .line 13
    .line 14
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string p0, "category"

    .line 18
    .line 19
    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const-string p0, "extra_param"

    .line 29
    .line 30
    invoke-virtual {v1, p0, p2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    return-object v0
.end method


# virtual methods
.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;->Q4()Lcom/p1/mobile/putong/core/ui/report/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;->R4()Lcom/p1/mobile/putong/core/ui/report/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q4()Lcom/p1/mobile/putong/core/ui/report/d;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/report/d;-><init>(Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public R4()Lcom/p1/mobile/putong/core/ui/report/e;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/e;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/report/e;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public d4()V
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/report/f;->b()Lcom/p1/mobile/putong/core/ui/report/f;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 9
    .line 10
    new-instance v1, Ll/pf60;

    .line 11
    .line 12
    const-string v2, "receive_report_user_id"

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/report/f;->k()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ll/pf60;

    .line 22
    .line 23
    const-string v3, "report_match_type"

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/report/f;->i()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    new-instance v3, Ll/pf60;

    .line 33
    .line 34
    const-string v4, "report_source_new"

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/report/f;->j()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-direct {v3, v4, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    new-instance v0, Ll/pf60;

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    const-string v5, "reporter_user_id"

    .line 54
    .line 55
    invoke-direct {v0, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    filled-new-array {v1, v2, v3, v0}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public f0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/core/ui/report/d;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/report/d;->p0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 7
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "user_id"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "category"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    move-object v3, p1

    .line 25
    check-cast v3, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/core/ui/report/ReportAct;

    .line 32
    .line 33
    iget-boolean v4, p1, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->h:Z

    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v0, "extra_param"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    move-object v6, p1

    .line 46
    check-cast v6, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 49
    .line 50
    move-object v1, p1

    .line 51
    check-cast v1, Lcom/p1/mobile/putong/core/ui/report/d;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    move-object v5, p0

    .line 58
    check-cast v5, Lcom/p1/mobile/putong/core/ui/report/ReportAct;

    .line 59
    .line 60
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/report/d;->k0(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/report/ReportCategory;ZLcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag$a;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/core/ui/report/d;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/report/d;->o0(IILandroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast v0, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroyView()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_report_submit_view"

    .line 2
    .line 3
    return-object p0
.end method
