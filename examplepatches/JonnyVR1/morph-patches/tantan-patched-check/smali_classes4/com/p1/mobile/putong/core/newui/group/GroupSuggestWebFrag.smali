.class public Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;
.super Lcom/p1/mobile/putong/core/ui/WebViewFrag;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z4(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;->g5(Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic a5(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;->f5(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b5(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;->h5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static d5(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "url"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method private synthetic f5(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;->e5()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method


# virtual methods
.method public T4()Ll/rx3$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag$a;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public V4(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->V4(Ljava/util/Map;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Ll/r97;->x2()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->z:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget p1, Ll/qa00;->E:I

    .line 26
    .line 27
    invoke-virtual {v0, v1, p1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->z:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    new-array v0, v0, [Landroid/view/View;

    .line 34
    .line 35
    aput-object p1, v0, v1

    .line 36
    .line 37
    invoke-static {v0}, Ll/bnl0;->g0([Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    :goto_0
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 41
    .line 42
    iget-object p1, p1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 43
    .line 44
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->accessOutterToken()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/spk;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/spk;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;)V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/tpk;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/tpk;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;->c5()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c5()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public e5()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/r97;->x2()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    return p0
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/rpk;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/rpk;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic g5(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 4

    .line 1
    new-instance v0, Ll/zpq;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestWebFrag;->c5()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3}, Ll/zpq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->H:Ll/zpq;

    .line 15
    .line 16
    new-instance v0, Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->U4()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    const-string v1, "H5-Authorization"

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 39
    .line 40
    const/4 v1, 0x2

    .line 41
    invoke-virtual {p1, v1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 42
    .line 43
    .line 44
    invoke-super {p0, v0}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->V4(Ljava/util/Map;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic h5(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->C:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->B:Landroid/widget/ProgressBar;

    .line 8
    .line 9
    const/16 p1, 0x8

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_group_chat_square"

    .line 2
    .line 3
    return-object p0
.end method
