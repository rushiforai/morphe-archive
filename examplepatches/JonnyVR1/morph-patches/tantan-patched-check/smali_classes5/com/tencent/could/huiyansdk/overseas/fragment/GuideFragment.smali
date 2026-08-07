.class public Lcom/tencent/could/huiyansdk/overseas/fragment/GuideFragment;
.super Lcom/tencent/could/huiyansdk/fragments/BaseFragment;
.source "SourceFile"


# static fields
.field public static final TAG:Ljava/lang/String; = "GuideFragment"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V3(Lcom/tencent/could/huiyansdk/overseas/fragment/GuideFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/fragment/GuideFragment;->b(Landroid/view/View;)V

    return-void
.end method

.method public static a(Landroid/view/View;)V
    .locals 5

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    const-string v1, "GuideFragment"

    .line 5
    .line 6
    const-string v2, "want go to authing fragment"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/a$a;->a:Lcom/tencent/could/huiyansdk/manager/a;

    .line 12
    .line 13
    new-instance v2, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 14
    .line 15
    invoke-direct {v2}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v3, v1, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    .line 19
    .line 20
    if-eqz v3, :cond_1

    .line 21
    .line 22
    sget-object v4, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 23
    .line 24
    iget-boolean v4, v4, Lcom/tencent/could/huiyansdk/api/j;->d:Z

    .line 25
    .line 26
    if-eqz v4, :cond_0

    .line 27
    .line 28
    const-string v1, "AuthFragmentManager"

    .line 29
    .line 30
    const-string v2, "Activity is exit, do can not change fragment"

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iput-object p0, v1, Lcom/tencent/could/huiyansdk/manager/a;->c:Landroidx/fragment/app/k;

    .line 41
    .line 42
    iget-object p0, v1, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    .line 43
    .line 44
    sget v0, Lcom/tencent/could/huiyansdk/R$id;->txy_main_fragment:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 47
    .line 48
    .line 49
    iget-object p0, v1, Lcom/tencent/could/huiyansdk/manager/a;->c:Landroidx/fragment/app/k;

    .line 50
    .line 51
    invoke-virtual {p0, v0, v2}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method private synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/overseas/fragment/GuideFragment;->doUserCancelEvent()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private doUserCancelEvent()V
    .locals 7

    .line 1
    sget v0, Lcom/tencent/could/huiyansdk/R$string;->txt_user_cancel_check:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 8
    .line 9
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const-string v2, "UserCancel"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    const-wide/16 v4, 0x0

    .line 17
    .line 18
    const-string v6, "GuidePage"

    .line 19
    .line 20
    invoke-interface/range {v1 .. v6}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->updateOperateInfo(Ljava/lang/String;IJLjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/16 v0, 0xd4

    .line 24
    .line 25
    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public backPopEvent()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->backPopEvent()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/overseas/fragment/GuideFragment;->doUserCancelEvent()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic getDefaultViewModelCreationExtras()Ll/cvb;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-super {p0}, Landroidx/lifecycle/e;->getDefaultViewModelCreationExtras()Ll/cvb;

    move-result-object p0

    return-object p0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p3, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    sget p3, Lcom/tencent/cloud/overseas/R$layout;->hy_overseas_fragment_guide:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    .line 13
    .line 14
    sget p2, Lcom/tencent/cloud/overseas/R$id;->hy_oversea_start_check_btn:I

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance p2, Ll/svk;

    .line 21
    .line 22
    invoke-direct {p2}, Ll/svk;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    .line 29
    .line 30
    sget p2, Lcom/tencent/cloud/overseas/R$id;->txy_hy_overseas_btn_back:I

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p2, Ll/tvk;

    .line 37
    .line 38
    invoke-direct {p2, p0}, Ll/tvk;-><init>(Lcom/tencent/could/huiyansdk/overseas/fragment/GuideFragment;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    sget-object p1, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 45
    .line 46
    iget-object v0, p1, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 51
    .line 52
    .line 53
    move-result-wide v5

    .line 54
    const-string v1, "ShowProtocolPage"

    .line 55
    .line 56
    const/4 v2, 0x1

    .line 57
    const-wide/16 v3, 0x1

    .line 58
    .line 59
    invoke-virtual/range {v0 .. v6}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    .line 63
    .line 64
    return-object p0
.end method
