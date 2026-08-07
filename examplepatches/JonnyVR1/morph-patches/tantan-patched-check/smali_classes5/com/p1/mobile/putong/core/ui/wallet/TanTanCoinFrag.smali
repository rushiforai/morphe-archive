.class public Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/w7i0;

.field public B:Ll/m8i0;

.field public C:Z

.field public D:[Ljava/lang/String;

.field public z:Z


# direct methods
.method public constructor <init>()V
    .locals 10

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v8, "th"

    .line 5
    .line 6
    const-string v9, "vi"

    .line 7
    .line 8
    const-string v0, "en"

    .line 9
    .line 10
    const-string v1, "zh_TW"

    .line 11
    .line 12
    const-string v2, "zh_HK"

    .line 13
    .line 14
    const-string v3, "zh"

    .line 15
    .line 16
    const-string v4, "ko"

    .line 17
    .line 18
    const-string v5, "ja"

    .line 19
    .line 20
    const-string v6, "id_ID"

    .line 21
    .line 22
    const-string v7, "tr_TR"

    .line 23
    .line 24
    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->D:[Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic M4(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "in_ID"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const-string v0, "id_ID"

    .line 18
    .line 19
    :cond_0
    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->P4(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public static O4(ZZ)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;-><init>()V

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
    const-string v2, "change_top_bg"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    const-string p0, "show_recharge_dialog"

    .line 17
    .line 18
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method private synthetic P4(Landroid/view/MenuItem;)Z
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->D:[Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Ll/e4i0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/e4i0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/jyb;->s([Ljava/lang/Object;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "?language="

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string p1, "en"

    .line 29
    .line 30
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    const-string v0, "&area=US"

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    const-string v0, ""

    .line 47
    .line 48
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->U7:I

    .line 61
    .line 62
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance v3, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v4, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/commerce/bill-details/index.html?speed=true&_bid=1005128#/"

    .line 69
    .line 70
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {p1}, Ll/xi5;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {v2, p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 92
    .line 93
    .line 94
    const-string p0, "e_bill_button"

    .line 95
    .line 96
    const-string p1, "p_wallet"

    .line 97
    .line 98
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    const/4 p0, 0x1

    .line 102
    return p0
.end method


# virtual methods
.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "change_top_bg"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->z:Z

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "show_recharge_dialog"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->C:Z

    .line 27
    .line 28
    new-instance v0, Ll/w7i0;

    .line 29
    .line 30
    invoke-direct {v0, p0, p0}, Ll/w7i0;-><init>(Ll/ner;Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->A:Ll/w7i0;

    .line 34
    .line 35
    new-instance v0, Ll/m8i0;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/m8i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->B:Ll/m8i0;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->A:Ll/w7i0;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->A:Ll/w7i0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/w7i0;->Z()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->A:Ll/w7i0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/w7i0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->A:Ll/w7i0;

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->z:Z

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/w7i0;->U0(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->A:Ll/w7i0;

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->C:Z

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ll/w7i0;->D1(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->B:Ll/m8i0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/m8i0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->A4(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    sget v0, Ll/ofc0;->a:I

    .line 17
    .line 18
    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 19
    .line 20
    .line 21
    sget p2, Ll/fdc0;->r0:I

    .line 22
    .line 23
    invoke-interface {p1, p2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p2, Ll/d4i0;

    .line 28
    .line 29
    invoke-direct {p2, p0}, Ll/d4i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pendChangeActionButtonTypeface()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_wallet"

    .line 2
    .line 3
    return-object p0
.end method
