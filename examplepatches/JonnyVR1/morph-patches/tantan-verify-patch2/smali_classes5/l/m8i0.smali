.class public Ll/m8i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/m8i0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/w7i0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/kcg0;

.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VText;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Lv/VText;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VText;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VText;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VRecyclerView;

.field public p:Ll/w7i0;

.field public q:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

.field public r:Landroidx/recyclerview/widget/GridLayoutManager;

.field public s:Ll/zzk;

.field public t:Ll/n3i0;

.field public u:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

.field public v:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

.field public w:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

.field public x:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

.field public y:Landroid/view/View;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m8i0;->q:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic A(Ll/m8i0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->j:Lv/VText;

    return-void
.end method

.method public static bridge synthetic B(Ll/m8i0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->l:Lv/VText;

    return-void
.end method

.method public static bridge synthetic C(Ll/m8i0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->h:Lv/VText;

    return-void
.end method

.method public static bridge synthetic E(Ll/m8i0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->m:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic F(Ll/m8i0;Lv/VRecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->o:Lv/VRecyclerView;

    return-void
.end method

.method public static bridge synthetic G(Ll/m8i0;Lv/navigationbar/VNavigationBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->a:Lv/navigationbar/VNavigationBar;

    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p1, p0, Ll/m8i0;->q:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->D:[Ljava/lang/String;

    .line 4
    .line 5
    new-instance v0, Ll/b8i0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/b8i0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jyb;->s([Ljava/lang/Object;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ljava/lang/String;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "?language="

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p1, "en"

    .line 31
    .line 32
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    const-string v0, "&area=US"

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const-string v0, ""

    .line 49
    .line 50
    :goto_1
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->U7:I

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    new-instance v4, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ll/m8i0;->J()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Ll/xi5;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {v2, v3, p0}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 99
    .line 100
    .line 101
    const-string p0, "e_bill_button"

    .line 102
    .line 103
    const-string p1, "p_wallet"

    .line 104
    .line 105
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method private synthetic V()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w7i0;->C1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p1, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 6
    .line 7
    iget-wide v1, p1, Ll/w7i0;->d:J

    .line 8
    .line 9
    iget v3, p1, Ll/w7i0;->e:I

    .line 10
    .line 11
    new-instance v4, Ll/k8i0;

    .line 12
    .line 13
    invoke-direct {v4, p0}, Ll/k8i0;-><init>(Ll/m8i0;)V

    .line 14
    .line 15
    .line 16
    new-instance v5, Ll/l8i0;

    .line 17
    .line 18
    invoke-direct {v5}, Ll/l8i0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static/range {v0 .. v5}, Ll/a5i0;->H1(Lcom/p1/mobile/android/app/Act;JILl/x20;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Ll/m8i0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m8i0;->X(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic b(Ll/m8i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m8i0;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/H5PayOrderData;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/H5PayOrderData;->itemId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/H5PayOrderData;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/H5PayOrderData;->itemId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/String;)Ljava/lang/Boolean;
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

.method public static synthetic i(Lcom/p1/mobile/putong/core/data/H5Merchandise;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;->id:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/data/H5PaymentChannels;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "payCools"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/H5PaymentChannels;->payment:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic k(Ll/m8i0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m8i0;->V()V

    return-void
.end method

.method public static synthetic l(Ll/m8i0;Lcom/p1/mobile/putong/core/data/LuckyTtConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m8i0;->U(Lcom/p1/mobile/putong/core/data/LuckyTtConfig;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n(Ll/m8i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m8i0;->W(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic p(Ll/m8i0;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method

.method public static bridge synthetic q(Ll/m8i0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->f:Lv/VText;

    return-void
.end method

.method public static bridge synthetic s(Ll/m8i0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->d:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic u(Ll/m8i0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->e:Lv/VText;

    return-void
.end method

.method public static bridge synthetic v(Ll/m8i0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->c:Lv/VText;

    return-void
.end method

.method public static bridge synthetic w(Ll/m8i0;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method

.method public static bridge synthetic x(Ll/m8i0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->n:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic y(Ll/m8i0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->i:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic z(Ll/m8i0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->k:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m8i0;->q:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/m8i0$a;->a(Ll/m8i0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final I(Ljava/util/Map$Entry;Ljava/util/ArrayList;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/H5Merchandise;",
            ">;>;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/H5Merchandise;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/H5PayOrderConfigData;->new_()Lcom/p1/mobile/putong/core/data/H5PayOrderConfigData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/H5PayOrderConfigData;->itemId:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eqz p2, :cond_0

    .line 35
    .line 36
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 37
    .line 38
    iput-wide p1, v0, Lcom/p1/mobile/putong/core/data/H5PayOrderConfigData;->price:D

    .line 39
    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->y6:I

    .line 45
    .line 46
    new-instance p2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p3, ""

    .line 55
    .line 56
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/H5PayOrderConfigData;->title:Ljava/lang/String;

    .line 72
    .line 73
    sget-object p0, Lcom/p1/mobile/putong/core/api/k;->V:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final J()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/commerce/bill-details/index.html?speed=true&_bid=1005128#/diamond"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/commerce/bill-details/index.html?speed=true&_bid=1005128#/"

    .line 15
    .line 16
    return-object p0
.end method

.method public K(Ll/w7i0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 2
    .line 3
    return-void
.end method

.method public L(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8i0;->w:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public M(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m8i0;->e:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/m8i0;->j:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public N(J)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/a5i0;->U(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/m8i0;->l:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/core/data/H5PaymentChannels;Ljava/lang/String;Ljava/util/List;Ljava/util/ArrayList;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/H5PaymentChannels;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/H5Merchandise;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/H5PayOrderData;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/rec0;->z:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;

    .line 17
    .line 18
    invoke-virtual {v0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {v0, p2, p3, p4, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->g(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/H5PaymentChannels;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 29
    .line 30
    const/high16 p2, 0x42b40000    # 90.0f

    .line 31
    .line 32
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    const/4 p3, -0x1

    .line 37
    invoke-direct {p1, p3, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 38
    .line 39
    .line 40
    const/high16 p2, 0x41400000    # 12.0f

    .line 41
    .line 42
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 47
    .line 48
    if-nez p5, :cond_0

    .line 49
    .line 50
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 55
    .line 56
    :cond_0
    iget-object p0, p0, Ll/m8i0;->z:Landroid/widget/LinearLayout;

    .line 57
    .line 58
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public P()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m8i0;->u:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m8i0;->y:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public R()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m8i0;->v:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/core/data/H5MerchandiseData;Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/H5MerchandiseData;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/H5PayOrderData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/H5MerchandiseData;->merchandises:Ljava/util/List;

    .line 8
    .line 9
    new-instance v1, Ll/h8i0;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/h8i0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->C(Ljava/util/List;Ll/qcj;)Ljava/util/HashMap;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/i8i0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/i8i0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p2, v1}, Ll/jyb;->C(Ljava/util/List;Ll/qcj;)Ljava/util/HashMap;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/H5MerchandiseData;->paymentChannels:Ljava/util/List;

    .line 28
    .line 29
    new-instance v1, Ll/j8i0;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/j8i0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v2, 0x0

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    :goto_0
    move-object v4, p1

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/data/H5PaymentChannels;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :goto_1
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-lez p1, :cond_6

    .line 64
    .line 65
    sget-object p1, Lcom/p1/mobile/putong/core/api/k;->V:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const/4 v0, 0x1

    .line 79
    move v8, v0

    .line 80
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_6

    .line 85
    .line 86
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    check-cast v1, Ljava/util/Map$Entry;

    .line 91
    .line 92
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    move-object v6, v3

    .line 97
    check-cast v6, Ljava/util/ArrayList;

    .line 98
    .line 99
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-nez v3, :cond_1

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_1
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-eqz v3, :cond_2

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_2
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lcom/p1/mobile/putong/core/data/H5Merchandise;

    .line 118
    .line 119
    iget v3, v3, Lcom/p1/mobile/putong/core/data/H5Merchandise;->quantity:I

    .line 120
    .line 121
    invoke-virtual {p0, v1, v6, v3}, Ll/m8i0;->I(Ljava/util/Map$Entry;Ljava/util/ArrayList;I)V

    .line 122
    .line 123
    .line 124
    invoke-static {}, Ll/t7a;->e()Z

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    if-eqz v5, :cond_3

    .line 129
    .line 130
    if-eq v3, v0, :cond_3

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_3
    invoke-static {}, Ll/t7a;->f()Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    if-eqz v5, :cond_4

    .line 138
    .line 139
    const/4 v5, 0x3

    .line 140
    if-eq v3, v5, :cond_4

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_4
    invoke-static {}, Ll/t7a;->d()Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-eqz v5, :cond_5

    .line 148
    .line 149
    const/16 v5, 0xc

    .line 150
    .line 151
    if-eq v3, v5, :cond_5

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_5
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    move-object v5, v3

    .line 159
    check-cast v5, Ljava/lang/String;

    .line 160
    .line 161
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    move-object v7, v1

    .line 170
    check-cast v7, Ljava/util/ArrayList;

    .line 171
    .line 172
    move-object v3, p0

    .line 173
    invoke-virtual/range {v3 .. v8}, Ll/m8i0;->O(Lcom/p1/mobile/putong/core/data/H5PaymentChannels;Ljava/lang/String;Ljava/util/List;Ljava/util/ArrayList;Z)V

    .line 174
    .line 175
    .line 176
    move v8, v2

    .line 177
    goto :goto_2

    .line 178
    :cond_6
    return-void
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/core/data/LuckyTtConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LuckyTtConfig;->jumpUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/w7i0;->E1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic X(Ljava/util/List;)V
    .locals 4

    .line 1
    new-instance v0, Ll/c8i0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/c8i0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->C(Ljava/util/List;Ll/qcj;)Ljava/util/HashMap;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    iget-object v1, p0, Ll/m8i0;->z:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ge v0, v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ll/m8i0;->z:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    instance-of v2, v1, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    check-cast v1, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->h(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Z

    .line 46
    .line 47
    .line 48
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    return-void
.end method

.method public Y()V
    .locals 4

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/joa;->n4()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/joa;->i4()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/m8i0;->A:Ll/kcg0;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/m8i0;->Z(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/k;->t3()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/f8i0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/f8i0;-><init>(Ll/m8i0;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/g8i0;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/g8i0;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Ll/m8i0;->A:Ll/kcg0;

    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 63
    move v1, v0

    .line 64
    :goto_1
    iget-object v2, p0, Ll/m8i0;->z:Landroid/widget/LinearLayout;

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-ge v1, v2, :cond_3

    .line 71
    .line 72
    iget-object v2, p0, Ll/m8i0;->z:Landroid/widget/LinearLayout;

    .line 73
    .line 74
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    instance-of v3, v2, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;

    .line 79
    .line 80
    if-eqz v3, :cond_2

    .line 81
    .line 82
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    return-void
.end method

.method public final Z(Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8i0;->x:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m8i0;->q:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b0(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m8i0;->m:Landroid/widget/TextView;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    cmp-long p1, p1, v1

    .line 6
    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p2, 0x0

    .line 12
    :goto_0
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/m8i0;->m:Landroid/widget/TextView;

    .line 16
    .line 17
    if-lez p1, :cond_1

    .line 18
    .line 19
    const/high16 p1, -0x1000000

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    const-string p1, "#4c000000"

    .line 23
    .line 24
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public c0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8i0;->w:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8i0;->x:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m8i0;->A:Ll/kcg0;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/m8i0;->Z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m8i0;->u:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->s()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Ll/m8i0;->u:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public f0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m8i0;->y:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreProduct;->i0:Lcom/p1/mobile/putong/core/data/LuckyTtConfig;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public g0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m8i0;->v:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/m8i0;->v:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->V1:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v0, "%s%s"

    .line 37
    .line 38
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public h0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m8i0;->m:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/m8i0;->m:Landroid/widget/TextView;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/high16 p1, -0x1000000

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p1, "#4c000000"

    .line 14
    .line 15
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w7i0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m8i0;->K(Ll/w7i0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m8i0;->H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 11

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/m8i0;->r:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 12
    .line 13
    iget-object v1, p0, Ll/m8i0;->o:Lv/VRecyclerView;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 25
    .line 26
    iget-object v0, v0, Ll/w7i0;->f:Ljava/util/List;

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_message_read:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 37
    .line 38
    iget-object v0, v0, Ll/w7i0;->f:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_0
    new-instance v0, Ll/n3i0;

    .line 44
    .line 45
    iget-object v1, p0, Ll/m8i0;->q:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 46
    .line 47
    iget-object v2, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 48
    .line 49
    iget-object v3, v2, Ll/w7i0;->f:Ljava/util/List;

    .line 50
    .line 51
    iget-boolean v2, v2, Ll/w7i0;->b:Z

    .line 52
    .line 53
    invoke-direct {v0, v1, v3, v2}, Ll/n3i0;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Ljava/util/List;Z)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/m8i0;->t:Ll/n3i0;

    .line 57
    .line 58
    new-instance v1, Ll/zzk;

    .line 59
    .line 60
    invoke-direct {v1, v0}, Ll/zzk;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 61
    .line 62
    .line 63
    iput-object v1, p0, Ll/m8i0;->s:Ll/zzk;

    .line 64
    .line 65
    new-instance v0, Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/m8i0;->C0()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Ll/m8i0;->z:Landroid/widget/LinearLayout;

    .line 75
    .line 76
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 77
    .line 78
    const/4 v2, -0x1

    .line 79
    const/4 v3, -0x2

    .line 80
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/m8i0;->z:Landroid/widget/LinearLayout;

    .line 87
    .line 88
    const/4 v1, 0x1

    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 90
    .line 91
    .line 92
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 93
    .line 94
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 95
    .line 96
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Qj()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    const/high16 v4, 0x41400000    # 12.0f

    .line 101
    .line 102
    const/4 v5, 0x0

    .line 103
    const/4 v6, 0x0

    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 107
    .line 108
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->b()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-nez v0, :cond_1

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-interface {v0}, Ll/hbs;->c()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_1

    .line 131
    .line 132
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->s()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_4

    .line 137
    .line 138
    :cond_1
    iget-object v0, p0, Ll/m8i0;->q:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 139
    .line 140
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    sget v7, Ll/rec0;->k2:I

    .line 145
    .line 146
    invoke-virtual {v0, v7, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    check-cast v0, Landroid/widget/LinearLayout;

    .line 151
    .line 152
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    .line 153
    .line 154
    invoke-direct {v7, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 155
    .line 156
    .line 157
    const/high16 v3, 0x41b00000    # 22.0f

    .line 158
    .line 159
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    iput v3, v7, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 164
    .line 165
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    iput v3, v7, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 170
    .line 171
    invoke-virtual {v0, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    .line 173
    .line 174
    const-string v3, "e_live_send_gift_record_button"

    .line 175
    .line 176
    const-string v4, "p_wallet"

    .line 177
    .line 178
    invoke-static {v3, v4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    const-string v3, "e_live_my_level"

    .line 182
    .line 183
    invoke-static {v3, v4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    sget v3, Ll/fdc0;->l0:I

    .line 187
    .line 188
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    check-cast v3, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 193
    .line 194
    sget v7, Lcom/p1/mobile/putong/core/pay/R$string;->F6:I

    .line 195
    .line 196
    invoke-virtual {v3, v7}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->H(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 197
    .line 198
    .line 199
    move-result-object v7

    .line 200
    sget v8, Ll/jbc0;->gb:I

    .line 201
    .line 202
    invoke-virtual {v7, v8}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->q(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 203
    .line 204
    .line 205
    sget v7, Ll/fdc0;->o0:I

    .line 206
    .line 207
    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v7

    .line 211
    check-cast v7, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 212
    .line 213
    sget v8, Lcom/p1/mobile/putong/core/pay/R$string;->I6:I

    .line 214
    .line 215
    invoke-virtual {v7, v8}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->H(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 216
    .line 217
    .line 218
    move-result-object v8

    .line 219
    sget v9, Ll/jbc0;->pb:I

    .line 220
    .line 221
    invoke-virtual {v8, v9}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->q(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 222
    .line 223
    .line 224
    sget v8, Ll/fdc0;->n0:I

    .line 225
    .line 226
    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v8

    .line 230
    check-cast v8, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 231
    .line 232
    iput-object v8, p0, Ll/m8i0;->u:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 233
    .line 234
    sget v9, Lcom/p1/mobile/putong/core/pay/R$string;->H6:I

    .line 235
    .line 236
    invoke-virtual {v8, v9}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->H(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 237
    .line 238
    .line 239
    move-result-object v8

    .line 240
    sget v9, Ll/jbc0;->ob:I

    .line 241
    .line 242
    invoke-virtual {v8, v9}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->q(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 243
    .line 244
    .line 245
    sget v8, Ll/fdc0;->m0:I

    .line 246
    .line 247
    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v8

    .line 251
    check-cast v8, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 252
    .line 253
    sget v9, Lcom/p1/mobile/putong/core/pay/R$string;->z:I

    .line 254
    .line 255
    invoke-virtual {v8, v9}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->H(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 256
    .line 257
    .line 258
    move-result-object v9

    .line 259
    sget v10, Ll/jbc0;->hb:I

    .line 260
    .line 261
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->q(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 262
    .line 263
    .line 264
    iget-object v9, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 265
    .line 266
    iget-object v9, v9, Ll/w7i0;->h:Landroid/view/View$OnClickListener;

    .line 267
    .line 268
    invoke-static {v8, v9}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 269
    .line 270
    .line 271
    sget v8, Ll/fdc0;->E0:I

    .line 272
    .line 273
    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v8

    .line 277
    check-cast v8, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 278
    .line 279
    sget v9, Lcom/p1/mobile/putong/core/pay/R$string;->J:I

    .line 280
    .line 281
    invoke-virtual {v8, v9}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->H(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 282
    .line 283
    .line 284
    move-result-object v9

    .line 285
    sget v10, Ll/jbc0;->rb:I

    .line 286
    .line 287
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->q(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 288
    .line 289
    .line 290
    sget v9, Ll/fdc0;->F0:I

    .line 291
    .line 292
    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 293
    .line 294
    .line 295
    move-result-object v9

    .line 296
    check-cast v9, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 297
    .line 298
    iput-object v9, p0, Ll/m8i0;->v:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 299
    .line 300
    sget v10, Lcom/p1/mobile/putong/core/pay/R$string;->D1:I

    .line 301
    .line 302
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->H(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 303
    .line 304
    .line 305
    move-result-object v9

    .line 306
    sget v10, Ll/jbc0;->sb:I

    .line 307
    .line 308
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->q(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 309
    .line 310
    .line 311
    iget-object v9, p0, Ll/m8i0;->v:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 312
    .line 313
    iget-object v10, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 314
    .line 315
    iget-object v10, v10, Ll/w7i0;->n:Landroid/view/View$OnClickListener;

    .line 316
    .line 317
    invoke-static {v9, v10}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 318
    .line 319
    .line 320
    sget v9, Ll/fdc0;->d1:I

    .line 321
    .line 322
    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 323
    .line 324
    .line 325
    move-result-object v9

    .line 326
    check-cast v9, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 327
    .line 328
    iput-object v9, p0, Ll/m8i0;->w:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 329
    .line 330
    sget v10, Lcom/p1/mobile/putong/core/pay/R$string;->F1:I

    .line 331
    .line 332
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->H(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 333
    .line 334
    .line 335
    move-result-object v9

    .line 336
    sget v10, Ll/jbc0;->ub:I

    .line 337
    .line 338
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->q(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 339
    .line 340
    .line 341
    move-result-object v9

    .line 342
    invoke-virtual {v9, v6}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->z(Z)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 343
    .line 344
    .line 345
    sget v9, Ll/fdc0;->z:I

    .line 346
    .line 347
    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 348
    .line 349
    .line 350
    move-result-object v9

    .line 351
    check-cast v9, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 352
    .line 353
    iput-object v9, p0, Ll/m8i0;->x:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 354
    .line 355
    sget v10, Lcom/p1/mobile/putong/core/pay/R$string;->G1:I

    .line 356
    .line 357
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->H(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 358
    .line 359
    .line 360
    move-result-object v9

    .line 361
    sget v10, Ll/jbc0;->kb:I

    .line 362
    .line 363
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->q(I)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 364
    .line 365
    .line 366
    move-result-object v9

    .line 367
    invoke-virtual {v9, v6}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;->z(Z)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 368
    .line 369
    .line 370
    iget-object v9, p0, Ll/m8i0;->u:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 371
    .line 372
    iget-object v10, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 373
    .line 374
    iget-object v10, v10, Ll/w7i0;->g:Landroid/view/View$OnClickListener;

    .line 375
    .line 376
    invoke-static {v9, v10}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 377
    .line 378
    .line 379
    iget-object v9, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 380
    .line 381
    iget-object v9, v9, Ll/w7i0;->i:Landroid/view/View$OnClickListener;

    .line 382
    .line 383
    invoke-static {v7, v9}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 384
    .line 385
    .line 386
    invoke-static {v8, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 387
    .line 388
    .line 389
    iget-object v7, p0, Ll/m8i0;->z:Landroid/widget/LinearLayout;

    .line 390
    .line 391
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 392
    .line 393
    .line 394
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->s()Z

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    if-eqz v0, :cond_2

    .line 399
    .line 400
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 401
    .line 402
    .line 403
    iget-object v0, p0, Ll/m8i0;->u:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinHeadItem;

    .line 404
    .line 405
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 406
    .line 407
    .line 408
    goto :goto_0

    .line 409
    :cond_2
    const-string v0, "e_live_receive_gift_record_button"

    .line 410
    .line 411
    invoke-static {v0, v4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    const-string v0, "e_live_income_button"

    .line 415
    .line 416
    invoke-static {v0, v4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getLiveVerification()Ll/cvu;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    invoke-interface {v0}, Ll/cvu;->a()Z

    .line 428
    .line 429
    .line 430
    move-result v0

    .line 431
    if-eqz v0, :cond_3

    .line 432
    .line 433
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 434
    .line 435
    .line 436
    iget-object v0, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 437
    .line 438
    iget-object v0, v0, Ll/w7i0;->l:Landroid/view/View$OnClickListener;

    .line 439
    .line 440
    invoke-static {v3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 441
    .line 442
    .line 443
    goto :goto_1

    .line 444
    :cond_3
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 445
    .line 446
    .line 447
    goto :goto_1

    .line 448
    :cond_4
    iget-object v0, p0, Ll/m8i0;->q:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 449
    .line 450
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 451
    .line 452
    .line 453
    move-result-object v0

    .line 454
    sget v7, Ll/rec0;->e0:I

    .line 455
    .line 456
    invoke-virtual {v0, v7, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    check-cast v0, Landroid/widget/TextView;

    .line 461
    .line 462
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    .line 463
    .line 464
    invoke-direct {v7, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 465
    .line 466
    .line 467
    const/high16 v3, 0x41c00000    # 24.0f

    .line 468
    .line 469
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 470
    .line 471
    .line 472
    move-result v3

    .line 473
    iput v3, v7, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 474
    .line 475
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 476
    .line 477
    .line 478
    move-result v3

    .line 479
    iput v3, v7, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 480
    .line 481
    invoke-virtual {v0, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 482
    .line 483
    .line 484
    iget-object v3, p0, Ll/m8i0;->z:Landroid/widget/LinearLayout;

    .line 485
    .line 486
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 487
    .line 488
    .line 489
    :goto_1
    iget-object v0, p0, Ll/m8i0;->s:Ll/zzk;

    .line 490
    .line 491
    iget-object v3, p0, Ll/m8i0;->z:Landroid/widget/LinearLayout;

    .line 492
    .line 493
    invoke-virtual {v0, v3}, Ll/zzk;->H(Landroid/view/View;)V

    .line 494
    .line 495
    .line 496
    iget-object v0, p0, Ll/m8i0;->q:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 497
    .line 498
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 499
    .line 500
    .line 501
    move-result-object v0

    .line 502
    sget v3, Ll/rec0;->j2:I

    .line 503
    .line 504
    invoke-virtual {v0, v3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 505
    .line 506
    .line 507
    move-result-object v0

    .line 508
    iput-object v0, p0, Ll/m8i0;->y:Landroid/view/View;

    .line 509
    .line 510
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    .line 511
    .line 512
    const/high16 v4, 0x42c80000    # 100.0f

    .line 513
    .line 514
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 515
    .line 516
    .line 517
    move-result v4

    .line 518
    invoke-direct {v3, v2, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 519
    .line 520
    .line 521
    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 522
    .line 523
    .line 524
    iget-object v0, p0, Ll/m8i0;->s:Ll/zzk;

    .line 525
    .line 526
    iget-object v2, p0, Ll/m8i0;->y:Landroid/view/View;

    .line 527
    .line 528
    invoke-virtual {v0, v2}, Ll/zzk;->F(Landroid/view/View;)V

    .line 529
    .line 530
    .line 531
    iget-object v0, p0, Ll/m8i0;->o:Lv/VRecyclerView;

    .line 532
    .line 533
    iget-object v2, p0, Ll/m8i0;->s:Ll/zzk;

    .line 534
    .line 535
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 536
    .line 537
    .line 538
    iget-object v0, p0, Ll/m8i0;->f:Lv/VText;

    .line 539
    .line 540
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 541
    .line 542
    .line 543
    move-result v2

    .line 544
    iget-object v3, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 545
    .line 546
    if-eqz v2, :cond_5

    .line 547
    .line 548
    iget-object v2, v3, Ll/w7i0;->j:Landroid/view/View$OnClickListener;

    .line 549
    .line 550
    goto :goto_2

    .line 551
    :cond_5
    iget-object v2, v3, Ll/w7i0;->k:Landroid/view/View$OnClickListener;

    .line 552
    .line 553
    :goto_2
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 554
    .line 555
    .line 556
    iget-object v0, p0, Ll/m8i0;->n:Landroid/widget/TextView;

    .line 557
    .line 558
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 559
    .line 560
    .line 561
    move-result v2

    .line 562
    iget-object v3, p0, Ll/m8i0;->p:Ll/w7i0;

    .line 563
    .line 564
    if-eqz v2, :cond_6

    .line 565
    .line 566
    iget-object v2, v3, Ll/w7i0;->j:Landroid/view/View$OnClickListener;

    .line 567
    .line 568
    goto :goto_3

    .line 569
    :cond_6
    iget-object v2, v3, Ll/w7i0;->k:Landroid/view/View$OnClickListener;

    .line 570
    .line 571
    :goto_3
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 572
    .line 573
    .line 574
    iget-object v0, p0, Ll/m8i0;->a:Lv/navigationbar/VNavigationBar;

    .line 575
    .line 576
    invoke-virtual {p0}, Ll/m8i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 577
    .line 578
    .line 579
    move-result-object v2

    .line 580
    invoke-virtual {v0, v2}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 581
    .line 582
    .line 583
    iget-object v0, p0, Ll/m8i0;->a:Lv/navigationbar/VNavigationBar;

    .line 584
    .line 585
    sget v2, Ll/jbc0;->n:I

    .line 586
    .line 587
    invoke-virtual {v0, v2}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 588
    .line 589
    .line 590
    iget-object v0, p0, Ll/m8i0;->a:Lv/navigationbar/VNavigationBar;

    .line 591
    .line 592
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->ga:I

    .line 593
    .line 594
    invoke-virtual {v0, v2}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 595
    .line 596
    .line 597
    new-instance v0, Lv/VIcon;

    .line 598
    .line 599
    invoke-virtual {p0}, Ll/m8i0;->C0()Landroid/content/Context;

    .line 600
    .line 601
    .line 602
    move-result-object v2

    .line 603
    invoke-direct {v0, v2}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 604
    .line 605
    .line 606
    const/4 v2, 0x3

    .line 607
    invoke-virtual {v0, v2}, Lv/VIcon;->setIconStyle(I)V

    .line 608
    .line 609
    .line 610
    sget v2, Ll/jbc0;->f4:I

    .line 611
    .line 612
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 613
    .line 614
    .line 615
    new-instance v2, Ll/a8i0;

    .line 616
    .line 617
    invoke-direct {v2, p0}, Ll/a8i0;-><init>(Ll/m8i0;)V

    .line 618
    .line 619
    .line 620
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 621
    .line 622
    .line 623
    iget-object v2, p0, Ll/m8i0;->a:Lv/navigationbar/VNavigationBar;

    .line 624
    .line 625
    new-array v3, v1, [Landroid/view/View;

    .line 626
    .line 627
    aput-object v0, v3, v6

    .line 628
    .line 629
    invoke-virtual {v2, v3}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 630
    .line 631
    .line 632
    iget-object v2, p0, Ll/m8i0;->a:Lv/navigationbar/VNavigationBar;

    .line 633
    .line 634
    invoke-virtual {v2}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 635
    .line 636
    .line 637
    move-result-object v2

    .line 638
    sget v3, Ll/jbc0;->m:I

    .line 639
    .line 640
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 641
    .line 642
    .line 643
    sget v2, Ll/jbc0;->m:I

    .line 644
    .line 645
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 646
    .line 647
    .line 648
    const/high16 v2, 0x40400000    # 3.0f

    .line 649
    .line 650
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 651
    .line 652
    .line 653
    move-result v3

    .line 654
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 655
    .line 656
    .line 657
    move-result v4

    .line 658
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 659
    .line 660
    .line 661
    move-result v5

    .line 662
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 663
    .line 664
    .line 665
    move-result v2

    .line 666
    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 667
    .line 668
    .line 669
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 670
    .line 671
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 672
    .line 673
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreProduct;->i0:Lcom/p1/mobile/putong/core/data/LuckyTtConfig;

    .line 674
    .line 675
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 676
    .line 677
    .line 678
    move-result v2

    .line 679
    if-eqz v2, :cond_7

    .line 680
    .line 681
    iget-object v2, p0, Ll/m8i0;->y:Landroid/view/View;

    .line 682
    .line 683
    sget v3, Ll/fdc0;->j:I

    .line 684
    .line 685
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 686
    .line 687
    .line 688
    move-result-object v2

    .line 689
    check-cast v2, Lv/AutoVDraweeView;

    .line 690
    .line 691
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/LuckyTtConfig;->bannerUrl:Ljava/lang/String;

    .line 692
    .line 693
    invoke-virtual {v2, v3, v1}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 694
    .line 695
    .line 696
    new-instance v3, Ll/d8i0;

    .line 697
    .line 698
    invoke-direct {v3, p0, v0}, Ll/d8i0;-><init>(Ll/m8i0;Lcom/p1/mobile/putong/core/data/LuckyTtConfig;)V

    .line 699
    .line 700
    .line 701
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 702
    .line 703
    .line 704
    :cond_7
    iget-object v0, p0, Ll/m8i0;->y:Landroid/view/View;

    .line 705
    .line 706
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 707
    .line 708
    .line 709
    iget-object v0, p0, Ll/m8i0;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 710
    .line 711
    invoke-static {}, Ll/wci0;->b()Z

    .line 712
    .line 713
    .line 714
    move-result v2

    .line 715
    xor-int/2addr v1, v2

    .line 716
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 717
    .line 718
    .line 719
    iget-object v0, p0, Ll/m8i0;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 720
    .line 721
    invoke-static {}, Ll/wci0;->b()Z

    .line 722
    .line 723
    .line 724
    move-result v1

    .line 725
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 726
    .line 727
    .line 728
    iget-object v0, p0, Ll/m8i0;->m:Landroid/widget/TextView;

    .line 729
    .line 730
    new-instance v1, Ll/e8i0;

    .line 731
    .line 732
    invoke-direct {v1, p0}, Ll/e8i0;-><init>(Ll/m8i0;)V

    .line 733
    .line 734
    .line 735
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 736
    .line 737
    .line 738
    return-void
.end method
