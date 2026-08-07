.class public Ll/psl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/gsl0;",
        ">;"
    }
.end annotation


# static fields
.field public static p:Ljava/lang/String;

.field public static q:Ljava/lang/String;


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VList;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Ll/gsl0;

.field public l:Lcom/p1/mobile/android/app/Act;

.field public m:Ll/krl0;

.field public n:Z

.field public o:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hsl0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/hsl0;-><init>(Ll/psl0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/psl0;->o:Ll/y20;

    .line 10
    .line 11
    iput-object p1, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/psl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/psl0;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/psl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/psl0;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/psl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/psl0;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/psl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/psl0;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e()V
    .locals 1

    .line 1
    invoke-static {}, Ll/qxv;->c()Z

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic f(Ll/psl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/psl0;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/psl0;Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/psl0;->w(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic j(Ll/psl0;Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/psl0;->x(Lcom/p1/mobile/putong/data/MessageLocation;)V

    return-void
.end method

.method public static n(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/nmp;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ROAMING_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    invoke-static {v0}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    const-string v0, "from_setting"

    .line 18
    .line 19
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const-string v1, "p_settings_location,manyou"

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    move-object p0, v1

    .line 28
    :cond_1
    const-string v0, "p_youthvip_page"

    .line 29
    .line 30
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    const/4 v0, 0x0

    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->youth_roaming:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 38
    .line 39
    invoke-static {p1, v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->Q0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 40
    .line 41
    .line 42
    return v0

    .line 43
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 44
    .line 45
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 46
    .line 47
    .line 48
    return v0

    .line 49
    :cond_3
    return v1
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/psl0;->n:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Ll/psl0;->k:Ll/gsl0;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/gsl0;->G0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "p_intl_tribe_view"

    .line 17
    .line 18
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    const-string v1, "tribe"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string v1, "settings"

    .line 28
    .line 29
    :goto_0
    const-string v2, "passport_entrance"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    filled-new-array {v1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "e_manyou"

    .line 40
    .line 41
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;->pageId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v1, 0x0

    .line 53
    new-array v1, v1, [Ll/sfj0$a;

    .line 54
    .line 55
    const-string v2, "e_add_roam_location"

    .line 56
    .line 57
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    iget-object v1, p0, Ll/psl0;->k:Ll/gsl0;

    .line 63
    .line 64
    invoke-virtual {v1}, Ll/gsl0;->G0()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const-string v2, "p_home_location,manyou"

    .line 69
    .line 70
    invoke-static {v2, v0, v1}, Ll/psl0;->n(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_1

    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    iget-object v0, p0, Ll/psl0;->k:Ll/gsl0;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/gsl0;->H0()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 84
    .line 85
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iget-object v1, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    const/4 v2, 0x5

    .line 92
    if-lt v0, v2, :cond_2

    .line 93
    .line 94
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Xn:I

    .line 95
    .line 96
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_2
    invoke-static {v1}, Ll/xxv;->g(Landroid/app/Activity;)Z

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 108
    .line 109
    invoke-static {p0, p1, p1}, Lcom/p1/mobile/putong/core/map/IntlMapAct;->h2(Landroid/content/Context;IZ)Landroid/content/Intent;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    const/4 v0, 0x2

    .line 114
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [Ll/sfj0$a;

    .line 11
    .line 12
    const-string v1, "e_select_location_view_refresh"

    .line 13
    .line 14
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    new-instance p1, Ll/osl0;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/osl0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/xxv;->k(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-static {}, Ll/qxv;->c()Z

    .line 54
    .line 55
    .line 56
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 57
    .line 58
    const/4 p1, 0x1

    .line 59
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/a;->w(Z)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p1}, Ll/xxv;->h(Lcom/p1/mobile/android/app/Act;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-static {p0}, Ll/gsl0;->D0(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic w(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/psl0;->k:Ll/gsl0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/gsl0;->H0()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/q;->R:Lcom/p1/mobile/putong/core/api/q$b;

    .line 17
    .line 18
    iget-object p0, p0, Ll/psl0;->k:Ll/gsl0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/gsl0;->H0()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Ll/mof0;->A(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic x(Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/nsl0;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/nsl0;-><init>(Ll/psl0;Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/psl0;->j:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/psl0;->j:Lv/VText;

    .line 8
    .line 9
    new-instance v1, Ll/isl0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/isl0;-><init>(Ll/psl0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public B(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p1, Ll/psl0;->p:Ljava/lang/String;

    .line 2
    .line 3
    sput-object p2, Ll/psl0;->q:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p0, Ll/psl0;->e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    sget p2, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object p0, Ll/psl0;->q:Ljava/lang/String;

    .line 25
    .line 26
    :goto_0
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public C(Ll/pf60;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/data/RoamedLocationData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/psl0;->e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->d:Lv/VImage;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/psl0;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/dbc0;->B:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->d:Lv/VImage;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/psl0;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Ll/dbc0;->A:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p0, p0, Ll/psl0;->g:Lv/VText;

    .line 53
    .line 54
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-lez p1, :cond_1

    .line 65
    .line 66
    const/4 p1, 0x1

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const/4 p1, 0x0

    .line 69
    :goto_1
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gsl0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/psl0;->m(Ll/gsl0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/psl0;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qsl0;->b(Ll/psl0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/psl0;->m:Ll/krl0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 4
    .line 5
    check-cast p1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/krl0;->B(Ljava/util/ArrayList;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public m(Ll/gsl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/psl0;->k:Ll/gsl0;

    .line 2
    .line 3
    return-void
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/psl0;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/psl0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Yn:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/psl0;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/jsl0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/jsl0;-><init>(Ll/psl0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/krl0;

    .line 19
    .line 20
    iget-object v1, p0, Ll/psl0;->k:Ll/gsl0;

    .line 21
    .line 22
    invoke-direct {v0, p0, v1}, Ll/krl0;-><init>(Ll/psl0;Ll/gsl0;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/psl0;->m:Ll/krl0;

    .line 26
    .line 27
    iget-object v0, p0, Ll/psl0;->h:Lv/VList;

    .line 28
    .line 29
    const-string v1, "VipLocationHistoryViewModel"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lv/VList;->setCrashLogFlag(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/psl0;->h:Lv/VList;

    .line 35
    .line 36
    iget-object v1, p0, Ll/psl0;->m:Ll/krl0;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;->pageId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x0

    .line 50
    new-array v2, v1, [Ll/sfj0$a;

    .line 51
    .line 52
    const-string v3, "e_select_location_view_refresh"

    .line 53
    .line 54
    invoke-static {v3, v0, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/psl0;->c:Lv/VText;

    .line 58
    .line 59
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/psl0;->g:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ll/xxv;->u()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_0

    .line 74
    .line 75
    invoke-static {}, Ll/xxv;->t()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    :cond_0
    const/4 v1, 0x1

    .line 82
    :cond_1
    invoke-virtual {p0, v1}, Ll/psl0;->z(Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/psl0;->e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->b:Landroid/widget/ImageView;

    .line 88
    .line 89
    sget v1, Ll/dbc0;->Fr:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/psl0;->i:Lv/VText;

    .line 95
    .line 96
    new-instance v1, Ll/ksl0;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/ksl0;-><init>(Ll/psl0;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    sget-object v0, Ll/psl0;->p:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_2

    .line 111
    .line 112
    sget-object v0, Ll/psl0;->q:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_2

    .line 119
    .line 120
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 123
    .line 124
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 131
    .line 132
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 133
    .line 134
    sput-object v1, Ll/psl0;->p:Ljava/lang/String;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 137
    .line 138
    sput-object v0, Ll/psl0;->q:Ljava/lang/String;

    .line 139
    .line 140
    :cond_2
    iget-object v0, p0, Ll/psl0;->e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->c:Lv/VText;

    .line 143
    .line 144
    sget-object v1, Ll/psl0;->q:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-eqz v1, :cond_3

    .line 151
    .line 152
    iget-object v1, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 153
    .line 154
    sget v2, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 155
    .line 156
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    goto :goto_0

    .line 161
    :cond_3
    sget-object v1, Ll/psl0;->q:Ljava/lang/String;

    .line 162
    .line 163
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Ll/psl0;->d:Lv/VImage;

    .line 167
    .line 168
    new-instance v1, Ll/lsl0;

    .line 169
    .line 170
    invoke-direct {v1, p0}, Ll/lsl0;-><init>(Ll/psl0;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Ll/psl0;->e:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 177
    .line 178
    new-instance v1, Ll/msl0;

    .line 179
    .line 180
    invoke-direct {v1, p0}, Ll/msl0;-><init>(Ll/psl0;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p0, Ll/psl0;->d:Lv/VImage;

    .line 187
    .line 188
    sget v0, Ll/dbc0;->Oc:I

    .line 189
    .line 190
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/psl0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "cards"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/NavigationCardIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, v1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->N5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Lcom/p1/mobile/putong/data/NavigationCardIntent;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Ll/psl0;->l:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public z(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/psl0;->f:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
