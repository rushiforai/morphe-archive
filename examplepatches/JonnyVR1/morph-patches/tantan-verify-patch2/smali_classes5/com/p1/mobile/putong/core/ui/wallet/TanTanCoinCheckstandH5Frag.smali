.class public Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;
.super Lcom/p1/mobile/putong/core/ui/WebViewFrag;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/s3i0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/s3i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic X4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->C:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic Z4(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;->f5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a5(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;->X4(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic b5(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;->e5(Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static d5(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;-><init>()V

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
    const-string p0, "wideViewPort"

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, p0, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method private g5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;->V4(Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public T4()Ll/rx3$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag$a;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;)V

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
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->accessOutterToken()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ll/q3i0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/q3i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/r3i0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/r3i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;->c5()Lcom/p1/mobile/putong/app/PutongAct;

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

.method public final synthetic e5(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 4

    .line 1
    new-instance v0, Ll/zpq;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;->c5()Lcom/p1/mobile/putong/app/PutongAct;

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

.method public final synthetic f5(Ljava/lang/Throwable;)V
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
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->P1:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->C:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;->g5()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
