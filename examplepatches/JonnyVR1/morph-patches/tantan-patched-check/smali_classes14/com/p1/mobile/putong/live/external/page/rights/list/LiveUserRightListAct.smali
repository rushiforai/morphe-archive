.class public Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListAct;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static Y1(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final X1()Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "right_type"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->LIVE_NICE_NUMBER:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/LiveUserRightNiceNumberFrag;->M4(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/page/rights/niceNumber/LiveUserRightNiceNumberFrag;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;->M4(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const p2, 0x1020002

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListAct;->X1()Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p2, p1}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Landroidx/fragment/app/k;->i()I

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 38
    .line 39
    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public onDestroyLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 2
    .line 3
    .line 4
    const-string p0, "context_right_act"

    .line 5
    .line 6
    invoke-static {p0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
