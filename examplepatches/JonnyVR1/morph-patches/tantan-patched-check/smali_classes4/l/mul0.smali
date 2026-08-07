.class public Ll/mul0;
.super Ll/gp60;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/gp60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    const-string v0, "vip"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MembershipType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MembershipType;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {p0, v1}, Ll/hp60;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/MembershipType;)D

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MembershipType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MembershipType;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1, p0}, Ll/hp60;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/MembershipType;)D

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    cmpl-double p0, v1, p0

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/User;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/kul0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/kul0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/lul0;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/lul0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gp60;->c()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->K5()Lrx/c;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gp60;->b:Ll/mdf0;

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
    iget-object v0, p0, Ll/gp60;->b:Ll/mdf0;

    .line 10
    .line 11
    iget-object v0, v0, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/gp60;->b:Ll/mdf0;

    .line 20
    .line 21
    iget-object v0, v0, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/usa;->N3()Lrx/c;

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p0, p0, Ll/gp60;->b:Ll/mdf0;

    .line 39
    .line 40
    iget-object p0, p0, Ll/mdf0;->d:Lcom/p1/mobile/putong/data/PayMethod;

    .line 41
    .line 42
    const-string v0, "alipay"

    .line 43
    .line 44
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->C3()Lrx/c;

    .line 55
    .line 56
    .line 57
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->B3()V

    .line 62
    .line 63
    .line 64
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gp60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {p0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
