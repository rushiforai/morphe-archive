.class public Ll/pow;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bn50;


# static fields
.field public static final d:[Ljava/lang/Object;


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final c:Ll/y3m;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    sput-object v0, Ll/pow;->d:[Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Ll/pow;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y3m;)V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y3m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pow;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    iput-object p3, p0, Ll/pow;->c:Ll/y3m;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d(Ljava/util/List;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->H9()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/ina;->S3()V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic i(Ll/pow;Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pow;->y(Ll/jl80;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/lu8;->o4()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic k()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/lu8;->o4()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic l(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic n(Ll/jl80;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_privilege_activated_done_button"

    .line 5
    .line 6
    const-string v1, "p_privilege_activated"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic o(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lu8;->n4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic s()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic t()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic u(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic v()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic w()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B2:Ll/sk9;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/sk9;->y3()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static z(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {p0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {p0}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pow;->c:Ll/y3m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pow;->c:Ll/y3m;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/y3m;->d()Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "vip_purchase_complete_shown"

    .line 11
    .line 12
    new-array v0, v1, [Ljava/lang/Object;

    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP_SUPERLIKE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 21
    .line 22
    if-ne p0, v0, :cond_1

    .line 23
    .line 24
    const-string p0, "superlike_purchase_complete_shown"

    .line 25
    .line 26
    new-array v0, v1, [Ljava/lang/Object;

    .line 27
    .line 28
    invoke-static {p0, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    if-ne p0, v0, :cond_2

    .line 35
    .line 36
    const-string p0, "svip_v1_boost_purchase_complete"

    .line 37
    .line 38
    new-array v0, v1, [Ljava/lang/Object;

    .line 39
    .line 40
    invoke-static {p0, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-static {p0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_3

    .line 49
    .line 50
    const-string p0, "see_purchase_complete_show"

    .line 51
    .line 52
    new-array v0, v1, [Ljava/lang/Object;

    .line 53
    .line 54
    invoke-static {p0, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    :goto_0
    const-string p0, "order_paid"

    .line 58
    .line 59
    new-array v0, v1, [Ljava/lang/Object;

    .line 60
    .line 61
    invoke-static {p0, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public c()V
    .locals 12

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->H9()Lrx/c;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 17
    .line 18
    new-instance v1, Ll/vnw;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/vnw;-><init>()V

    .line 21
    .line 22
    .line 23
    const-wide/16 v2, 0xc8

    .line 24
    .line 25
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 29
    .line 30
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const-wide/16 v1, 0x3e8

    .line 35
    .line 36
    if-nez v0, :cond_6

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 53
    .line 54
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_6

    .line 59
    .line 60
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 61
    .line 62
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 70
    .line 71
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 78
    .line 79
    new-instance v3, Ll/ynw;

    .line 80
    .line 81
    invoke-direct {v3}, Ll/ynw;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v3, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_2
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 89
    .line 90
    invoke-static {v0}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 97
    .line 98
    new-instance v3, Ll/znw;

    .line 99
    .line 100
    invoke-direct {v3}, Ll/znw;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-static {v0, v3, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_3
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 108
    .line 109
    invoke-static {v0}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 116
    .line 117
    new-instance v3, Ll/aow;

    .line 118
    .line 119
    invoke-direct {v3}, Ll/aow;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-static {v0, v3, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_4
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 127
    .line 128
    invoke-static {v0}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-eqz v0, :cond_5

    .line 133
    .line 134
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 135
    .line 136
    new-instance v3, Ll/bow;

    .line 137
    .line 138
    invoke-direct {v3}, Ll/bow;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-static {v0, v3, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_5
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 146
    .line 147
    invoke-static {v0}, Ll/wib0;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_7

    .line 152
    .line 153
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 154
    .line 155
    new-instance v3, Ll/cow;

    .line 156
    .line 157
    invoke-direct {v3}, Ll/cow;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-static {v0, v3, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 161
    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_6
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 165
    .line 166
    new-instance v3, Ll/xnw;

    .line 167
    .line 168
    invoke-direct {v3}, Ll/xnw;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-static {v0, v3, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 172
    .line 173
    .line 174
    :cond_7
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_9

    .line 187
    .line 188
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 189
    .line 190
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-nez v0, :cond_8

    .line 195
    .line 196
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 197
    .line 198
    invoke-static {v0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-eqz v0, :cond_9

    .line 203
    .line 204
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 205
    .line 206
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 207
    .line 208
    invoke-virtual {v0}, Ll/usa;->N3()Lrx/c;

    .line 209
    .line 210
    .line 211
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 212
    .line 213
    new-instance v3, Ll/dow;

    .line 214
    .line 215
    invoke-direct {v3}, Ll/dow;-><init>()V

    .line 216
    .line 217
    .line 218
    invoke-static {v0, v3, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 219
    .line 220
    .line 221
    goto :goto_2

    .line 222
    :cond_9
    invoke-static {}, Ll/s7a;->f()Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-eqz v0, :cond_a

    .line 227
    .line 228
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 229
    .line 230
    invoke-static {v0}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    if-eqz v0, :cond_a

    .line 235
    .line 236
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 237
    .line 238
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 239
    .line 240
    invoke-virtual {v0}, Ll/usa;->N3()Lrx/c;

    .line 241
    .line 242
    .line 243
    :cond_a
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-interface {v0}, Ll/r97;->B()Z

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    if-eqz v0, :cond_b

    .line 256
    .line 257
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 258
    .line 259
    new-instance v3, Ll/eow;

    .line 260
    .line 261
    invoke-direct {v3}, Ll/eow;-><init>()V

    .line 262
    .line 263
    .line 264
    invoke-static {v0, v3, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 265
    .line 266
    .line 267
    :cond_b
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    invoke-interface {v0}, Ll/r97;->B()Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    if-eqz v0, :cond_c

    .line 280
    .line 281
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 282
    .line 283
    new-instance v3, Ll/fow;

    .line 284
    .line 285
    invoke-direct {v3}, Ll/fow;-><init>()V

    .line 286
    .line 287
    .line 288
    invoke-static {v0, v3, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 289
    .line 290
    .line 291
    :cond_c
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_NON_LIVE_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 292
    .line 293
    iget-object v3, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 294
    .line 295
    if-eq v0, v3, :cond_d

    .line 296
    .line 297
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 298
    .line 299
    if-ne v0, v3, :cond_e

    .line 300
    .line 301
    :cond_d
    const-string v0, "coin"

    .line 302
    .line 303
    invoke-static {v3, v0}, Ll/fp60;->K(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 304
    .line 305
    .line 306
    :cond_e
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s3()Z

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    if-eqz v0, :cond_10

    .line 319
    .line 320
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 321
    .line 322
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    if-nez v0, :cond_f

    .line 327
    .line 328
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 329
    .line 330
    invoke-static {v0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    if-nez v0, :cond_f

    .line 335
    .line 336
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 337
    .line 338
    invoke-static {v0}, Ll/wib0;->n(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 339
    .line 340
    .line 341
    move-result v0

    .line 342
    if-nez v0, :cond_f

    .line 343
    .line 344
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 345
    .line 346
    invoke-static {v0}, Ll/wib0;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 347
    .line 348
    .line 349
    move-result v0

    .line 350
    if-eqz v0, :cond_10

    .line 351
    .line 352
    :cond_f
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 353
    .line 354
    new-instance v3, Ll/gow;

    .line 355
    .line 356
    invoke-direct {v3}, Ll/gow;-><init>()V

    .line 357
    .line 358
    .line 359
    invoke-static {v0, v3, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 360
    .line 361
    .line 362
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 363
    .line 364
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 365
    .line 366
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->K5()Lrx/c;

    .line 367
    .line 368
    .line 369
    :cond_10
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 370
    .line 371
    .line 372
    move-result v0

    .line 373
    if-nez v0, :cond_12

    .line 374
    .line 375
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 376
    .line 377
    iget-object v1, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 378
    .line 379
    if-eq v0, v1, :cond_11

    .line 380
    .line 381
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 382
    .line 383
    if-eq v0, v1, :cond_11

    .line 384
    .line 385
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 386
    .line 387
    if-eq v0, v1, :cond_11

    .line 388
    .line 389
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 390
    .line 391
    if-ne v0, v1, :cond_12

    .line 392
    .line 393
    :cond_11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 394
    .line 395
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 396
    .line 397
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Q5()Lrx/c;

    .line 398
    .line 399
    .line 400
    :cond_12
    iget-object v0, p0, Ll/pow;->c:Ll/y3m;

    .line 401
    .line 402
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    const-string v1, "vip"

    .line 407
    .line 408
    if-eqz v0, :cond_13

    .line 409
    .line 410
    iget-object v0, p0, Ll/pow;->c:Ll/y3m;

    .line 411
    .line 412
    invoke-interface {v0}, Ll/y3m;->e()Z

    .line 413
    .line 414
    .line 415
    move-result v0

    .line 416
    if-eqz v0, :cond_13

    .line 417
    .line 418
    goto/16 :goto_3

    .line 419
    .line 420
    :cond_13
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 421
    .line 422
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 423
    .line 424
    .line 425
    move-result v0

    .line 426
    if-eqz v0, :cond_16

    .line 427
    .line 428
    iget-object v0, p0, Ll/pow;->a:Lcom/p1/mobile/android/app/Act;

    .line 429
    .line 430
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    sget v2, Ll/rec0;->R2:I

    .line 435
    .line 436
    const/4 v3, 0x0

    .line 437
    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    check-cast v0, Landroid/view/ViewGroup;

    .line 442
    .line 443
    sget v2, Ll/fdc0;->Z:I

    .line 444
    .line 445
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 446
    .line 447
    .line 448
    move-result-object v2

    .line 449
    check-cast v2, Landroid/widget/ImageView;

    .line 450
    .line 451
    sget v4, Ll/fdc0;->Z0:I

    .line 452
    .line 453
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 454
    .line 455
    .line 456
    move-result-object v4

    .line 457
    check-cast v4, Landroid/widget/TextView;

    .line 458
    .line 459
    sget v5, Ll/fdc0;->N:I

    .line 460
    .line 461
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 462
    .line 463
    .line 464
    move-result-object v5

    .line 465
    check-cast v5, Lv/VButton;

    .line 466
    .line 467
    sget v6, Ll/fdc0;->m1:I

    .line 468
    .line 469
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 470
    .line 471
    .line 472
    move-result-object v6

    .line 473
    check-cast v6, Lv/VButton;

    .line 474
    .line 475
    const-class v7, Lcom/p1/mobile/android/app/Dialog;

    .line 476
    .line 477
    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object v7

    .line 481
    const-string v8, "p_privilege_activated"

    .line 482
    .line 483
    invoke-static {v8, v7}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 484
    .line 485
    .line 486
    move-result-object v7

    .line 487
    invoke-virtual {p0}, Ll/pow;->x()[Ljava/lang/Object;

    .line 488
    .line 489
    .line 490
    move-result-object v8

    .line 491
    const-string v9, "skuID"

    .line 492
    .line 493
    invoke-static {v8, v9}, Ll/jyb;->H([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 494
    .line 495
    .line 496
    move-result v10

    .line 497
    if-ltz v10, :cond_14

    .line 498
    .line 499
    array-length v11, v8

    .line 500
    if-ge v10, v11, :cond_14

    .line 501
    .line 502
    add-int/lit8 v10, v10, 0x1

    .line 503
    .line 504
    aget-object v3, v8, v10

    .line 505
    .line 506
    check-cast v3, Ljava/lang/String;

    .line 507
    .line 508
    :cond_14
    const-string v8, "productType"

    .line 509
    .line 510
    invoke-static {v8, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 511
    .line 512
    .line 513
    move-result-object v8

    .line 514
    invoke-static {v9, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 515
    .line 516
    .line 517
    move-result-object v3

    .line 518
    filled-new-array {v8, v3}, [Ll/pf60;

    .line 519
    .line 520
    .line 521
    move-result-object v3

    .line 522
    invoke-virtual {v7, v3}, Ll/l4g0;->p([Ll/pf60;)V

    .line 523
    .line 524
    .line 525
    iget-object v3, p0, Ll/pow;->a:Lcom/p1/mobile/android/app/Act;

    .line 526
    .line 527
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 528
    .line 529
    .line 530
    move-result v3

    .line 531
    if-eqz v3, :cond_15

    .line 532
    .line 533
    goto/16 :goto_6

    .line 534
    .line 535
    :cond_15
    iget-object v3, p0, Ll/pow;->a:Lcom/p1/mobile/android/app/Act;

    .line 536
    .line 537
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 538
    .line 539
    .line 540
    move-result-object v3

    .line 541
    invoke-virtual {v3, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 542
    .line 543
    .line 544
    move-result-object v0

    .line 545
    new-instance v3, Ll/how;

    .line 546
    .line 547
    invoke-direct {v3, v7}, Ll/how;-><init>(Ll/l4g0;)V

    .line 548
    .line 549
    .line 550
    invoke-virtual {v0, v3}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 551
    .line 552
    .line 553
    move-result-object v0

    .line 554
    new-instance v3, Ll/iow;

    .line 555
    .line 556
    invoke-direct {v3, v7}, Ll/iow;-><init>(Ll/l4g0;)V

    .line 557
    .line 558
    .line 559
    invoke-virtual {v0, v3}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 560
    .line 561
    .line 562
    move-result-object v0

    .line 563
    invoke-virtual {v0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 564
    .line 565
    .line 566
    move-result-object v0

    .line 567
    iget-object v3, p0, Ll/pow;->a:Lcom/p1/mobile/android/app/Act;

    .line 568
    .line 569
    sget v7, Ll/jbc0;->oc:I

    .line 570
    .line 571
    invoke-virtual {v3, v7}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 572
    .line 573
    .line 574
    move-result-object v3

    .line 575
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 576
    .line 577
    .line 578
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->W9:I

    .line 579
    .line 580
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(I)V

    .line 581
    .line 582
    .line 583
    new-instance v2, Ll/jow;

    .line 584
    .line 585
    invoke-direct {v2, v0}, Ll/jow;-><init>(Ll/jl80;)V

    .line 586
    .line 587
    .line 588
    invoke-virtual {v5, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 589
    .line 590
    .line 591
    new-instance v2, Ll/kow;

    .line 592
    .line 593
    invoke-direct {v2, p0, v0}, Ll/kow;-><init>(Ll/pow;Ll/jl80;)V

    .line 594
    .line 595
    .line 596
    invoke-virtual {v6, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 597
    .line 598
    .line 599
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 600
    .line 601
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 602
    .line 603
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreProduct;->a0:Ll/jxd0;

    .line 604
    .line 605
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 606
    .line 607
    invoke-virtual {v0, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 608
    .line 609
    .line 610
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 611
    .line 612
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 613
    .line 614
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreProduct;->b0:Ll/jxd0;

    .line 615
    .line 616
    invoke-virtual {v0, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 617
    .line 618
    .line 619
    goto :goto_3

    .line 620
    :cond_16
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 621
    .line 622
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 623
    .line 624
    .line 625
    move-result v0

    .line 626
    if-eqz v0, :cond_17

    .line 627
    .line 628
    goto :goto_3

    .line 629
    :cond_17
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 630
    .line 631
    invoke-static {v0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 632
    .line 633
    .line 634
    move-result v0

    .line 635
    if-nez v0, :cond_1a

    .line 636
    .line 637
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 638
    .line 639
    invoke-static {v0}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 640
    .line 641
    .line 642
    move-result v0

    .line 643
    if-eqz v0, :cond_18

    .line 644
    .line 645
    goto :goto_3

    .line 646
    :cond_18
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 647
    .line 648
    invoke-static {v0}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 649
    .line 650
    .line 651
    move-result v0

    .line 652
    if-eqz v0, :cond_19

    .line 653
    .line 654
    const-string v0, "\u8d2d\u4e70\u6210\u529f\uff0c\u7acb\u523b\u4f53\u9a8c\u4e13\u5c5e\u6743\u76ca\u5427"

    .line 655
    .line 656
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 657
    .line 658
    .line 659
    goto :goto_3

    .line 660
    :cond_19
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->d7:I

    .line 661
    .line 662
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 663
    .line 664
    .line 665
    :cond_1a
    :goto_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 666
    .line 667
    .line 668
    move-result-object v0

    .line 669
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 670
    .line 671
    .line 672
    move-result-object v0

    .line 673
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 674
    .line 675
    .line 676
    move-result v0

    .line 677
    if-eqz v0, :cond_1d

    .line 678
    .line 679
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 680
    .line 681
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 682
    .line 683
    .line 684
    move-result v0

    .line 685
    if-eqz v0, :cond_1b

    .line 686
    .line 687
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 688
    .line 689
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 690
    .line 691
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 692
    .line 693
    .line 694
    move-result-object v1

    .line 695
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->N4(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 696
    .line 697
    .line 698
    goto :goto_4

    .line 699
    :cond_1b
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 700
    .line 701
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 702
    .line 703
    .line 704
    move-result v0

    .line 705
    if-eqz v0, :cond_1c

    .line 706
    .line 707
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 708
    .line 709
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 710
    .line 711
    const-string v1, "seeWhoLikedMe"

    .line 712
    .line 713
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 714
    .line 715
    .line 716
    move-result-object v1

    .line 717
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->N4(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 718
    .line 719
    .line 720
    goto :goto_4

    .line 721
    :cond_1c
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 722
    .line 723
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 724
    .line 725
    .line 726
    move-result v0

    .line 727
    if-eqz v0, :cond_1d

    .line 728
    .line 729
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 730
    .line 731
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 732
    .line 733
    const-string v1, "svip"

    .line 734
    .line 735
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 736
    .line 737
    .line 738
    move-result-object v1

    .line 739
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->N4(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 740
    .line 741
    .line 742
    :cond_1d
    :goto_4
    iget-object v0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 743
    .line 744
    invoke-static {v0}, Ll/pow;->z(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 745
    .line 746
    .line 747
    move-result v0

    .line 748
    if-eqz v0, :cond_1e

    .line 749
    .line 750
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 751
    .line 752
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 753
    .line 754
    invoke-virtual {v0}, Ll/joa;->y4()Lrx/c;

    .line 755
    .line 756
    .line 757
    move-result-object v0

    .line 758
    new-instance v1, Ll/low;

    .line 759
    .line 760
    invoke-direct {v1}, Ll/low;-><init>()V

    .line 761
    .line 762
    .line 763
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 764
    .line 765
    .line 766
    move-result-object v0

    .line 767
    new-instance v1, Ll/mow;

    .line 768
    .line 769
    invoke-direct {v1}, Ll/mow;-><init>()V

    .line 770
    .line 771
    .line 772
    new-instance v2, Ll/now;

    .line 773
    .line 774
    invoke-direct {v2}, Ll/now;-><init>()V

    .line 775
    .line 776
    .line 777
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 778
    .line 779
    .line 780
    move-result-object v1

    .line 781
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 782
    .line 783
    .line 784
    goto :goto_5

    .line 785
    :cond_1e
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 786
    .line 787
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 788
    .line 789
    invoke-virtual {v0}, Ll/joa;->y4()Lrx/c;

    .line 790
    .line 791
    .line 792
    move-result-object v0

    .line 793
    new-instance v1, Ll/oow;

    .line 794
    .line 795
    invoke-direct {v1}, Ll/oow;-><init>()V

    .line 796
    .line 797
    .line 798
    new-instance v2, Ll/wnw;

    .line 799
    .line 800
    invoke-direct {v2}, Ll/wnw;-><init>()V

    .line 801
    .line 802
    .line 803
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 804
    .line 805
    .line 806
    move-result-object v1

    .line 807
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 808
    .line 809
    .line 810
    :goto_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 811
    .line 812
    iget-object p0, p0, Ll/pow;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 813
    .line 814
    if-ne v0, p0, :cond_1f

    .line 815
    .line 816
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 817
    .line 818
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 819
    .line 820
    invoke-virtual {p0}, Ll/jan;->P3()Lrx/c;

    .line 821
    .line 822
    .line 823
    :cond_1f
    :goto_6
    return-void
.end method

.method public x()[Ljava/lang/Object;
    .locals 0

    .line 1
    sget-object p0, Ll/pow;->d:[Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic y(Ll/jl80;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    new-array p2, p2, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_privilege_activated_view_privilege_button"

    .line 5
    .line 6
    const-string v1, "p_privilege_activated"

    .line 7
    .line 8
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget-object v0, p0, Ll/pow;->a:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-interface {p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pf(Landroid/content/Context;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-nez p2, :cond_0

    .line 26
    .line 27
    iget-object p2, p0, Ll/pow;->a:Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p0, p0, Ll/pow;->a:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->K6(Landroid/content/Context;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 47
    .line 48
    .line 49
    return-void
.end method
