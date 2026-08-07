.class public Ll/qi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h2m;
.implements Ll/sol;


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Landroid/app/Activity;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/alipay/sdk/app/EnvUtils$EnvEnum;->ONLINE:Lcom/alipay/sdk/app/EnvUtils$EnvEnum;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/alipay/sdk/app/EnvUtils;->setEnv(Lcom/alipay/sdk/app/EnvUtils$EnvEnum;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    check-cast p1, Landroid/app/Activity;

    .line 5
    .line 6
    iput-object p1, p0, Ll/qi0;->b:Landroid/app/Activity;

    .line 7
    .line 8
    iput-object p2, p0, Ll/qi0;->a:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static G(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "alipays://platformapi/startapp?appId=20000067&url="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Landroid/content/Intent;

    .line 20
    .line 21
    const-string v1, "android.intent.action.VIEW"

    .line 22
    .line 23
    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/high16 v1, 0x20000

    .line 31
    .line 32
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->resolveActivityInfo(Landroid/content/pm/PackageManager;I)Landroid/content/pm/ActivityInfo;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    const-string p0, "alipay"

    .line 43
    .line 44
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic d(Ll/qi0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;ZLl/x20;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/qi0;->r(Lcom/p1/mobile/putong/data/PurchasePaymentParam;ZLl/x20;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ljava/lang/Boolean;)Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->toSigning:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 11
    .line 12
    return-object p0
.end method

.method public static synthetic f(Ll/qi0;Lcom/p1/mobile/putong/data/Order;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qi0;->v(Lcom/p1/mobile/putong/data/Order;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qi0;->x(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h(Ll/qi0;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/qi0;->p(Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i(Ll/qi0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qi0;->s(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qi0;->t(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qi0;->u(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l(Ll/qi0;Lcom/p1/mobile/putong/data/Order;Ll/x20;)Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qi0;->q(Lcom/p1/mobile/putong/data/Order;Ll/x20;)Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qi0;->w(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static y(Landroid/app/Activity;I)V
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->S6:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->S6:I

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :pswitch_1
    return-void

    .line 24
    :pswitch_2
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->Q6:I

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    nop

    .line 35
    :pswitch_data_0
    .packed-switch 0xbea3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V
    .locals 7

    .line 1
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qi0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v3, "alipay"

    .line 8
    .line 9
    move-object v4, p2

    .line 10
    move v5, p3

    .line 11
    move-object v6, p4

    .line 12
    invoke-virtual/range {v0 .. v6}, Ll/lib0$a;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V
    .locals 6

    .line 1
    const-string p0, "skuID"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string p0, "platform"

    .line 10
    .line 11
    const-string p1, "alipay"

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string p0, "code"

    .line 18
    .line 19
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string p0, "order_id"

    .line 28
    .line 29
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const-string p0, "order_type"

    .line 34
    .line 35
    const-string p1, "pay"

    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    const-string p0, "error_message"

    .line 42
    .line 43
    invoke-static {p0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    filled-new-array/range {v0 .. v5}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->U()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_0

    .line 68
    .line 69
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string p2, "no_secret_payment"

    .line 82
    .line 83
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->D3()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const-string p2, "user_secret_staus"

    .line 99
    .line 100
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    new-array p1, p1, [Ll/pf60;

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    check-cast p0, [Ll/pf60;

    .line 118
    .line 119
    const-string p1, "e_purchase_order_response"

    .line 120
    .line 121
    const-string p2, "p_purchase_page"

    .line 122
    .line 123
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public final C(Lcom/p1/mobile/putong/data/PaymentParam;)V
    .locals 2

    .line 1
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qi0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "alipay"

    .line 8
    .line 9
    invoke-virtual {v0, p0, p1, v1}, Ll/lib0$a;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final D(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V
    .locals 7

    .line 1
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qi0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v3, "alipay"

    .line 8
    .line 9
    move-object v4, p2

    .line 10
    move v5, p3

    .line 11
    move-object v6, p4

    .line 12
    invoke-virtual/range {v0 .. v6}, Ll/lib0$a;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V
    .locals 6

    .line 1
    const-string p0, "skuID"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string p0, "platform"

    .line 10
    .line 11
    const-string p1, "alipay"

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string p0, "contract_id"

    .line 18
    .line 19
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string p0, "order_type"

    .line 24
    .line 25
    const-string p1, "contract"

    .line 26
    .line 27
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string p0, "code"

    .line 32
    .line 33
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    const-string p0, "error_message"

    .line 42
    .line 43
    invoke-static {p0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    filled-new-array/range {v0 .. v5}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->U()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_0

    .line 68
    .line 69
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string p2, "no_secret_payment"

    .line 82
    .line 83
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->D3()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const-string p2, "user_secret_staus"

    .line 99
    .line 100
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    new-array p1, p1, [Ll/pf60;

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    check-cast p0, [Ll/pf60;

    .line 118
    .line 119
    const-string p1, "e_purchase_order_response"

    .line 120
    .line 121
    const-string p2, "p_purchase_page"

    .line 122
    .line 123
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public F(Ljava/lang/String;Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/PaymentParam;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/qi0;->b:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/qi0;->G(Landroid/content/Context;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    return-object p0

    .line 13
    :catch_0
    move-exception p1

    .line 14
    instance-of v0, p1, Ljava/lang/IllegalStateException;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "alipay"

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    throw p1

    .line 32
    :cond_1
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ll/bsj0;->z(Ljava/lang/Throwable;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, ""

    .line 44
    .line 45
    invoke-virtual {p0, p2, v2, v0, v1}, Ll/qi0;->E(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1}, Ll/bsj0;->z(Ljava/lang/Throwable;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string v1, "default"

    .line 57
    .line 58
    invoke-virtual {p0, p2, v1, v0, p1}, Ll/qi0;->D(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public a(Lcom/p1/mobile/putong/core/data/SignPaymentParam;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/SignPaymentParam;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/alipay/contract/signAndPay"

    .line 2
    .line 3
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qi0;->C(Lcom/p1/mobile/putong/data/PaymentParam;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->V(Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/ki0;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/ki0;-><init>(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/li0;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1}, Ll/li0;-><init>(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/SignPaymentParam;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/SignPaymentParam;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/alipay/contract/sign"

    .line 2
    .line 3
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qi0;->C(Lcom/p1/mobile/putong/data/PaymentParam;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->V(Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/ii0;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/ii0;-><init>(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/ji0;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/ji0;-><init>(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PurchasePaymentParam;",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/alipay/create-order"

    .line 2
    .line 3
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qi0;->z(Lcom/p1/mobile/putong/data/PaymentParam;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 9
    .line 10
    sget-object v1, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 11
    .line 12
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->V(Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/gi0;

    .line 25
    .line 26
    invoke-direct {v2, p0, p1, v0, p2}, Ll/gi0;-><init>(Ll/qi0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;ZLl/x20;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    new-instance v0, Ll/hi0;

    .line 42
    .line 43
    invoke-direct {v0, p0, p1}, Ll/hi0;-><init>(Ll/qi0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public final n(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->U()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const v0, 0xbea3

    .line 16
    .line 17
    .line 18
    if-ne p1, v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/qi0;->b:Landroid/app/Activity;

    .line 21
    .line 22
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->Q6:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PurchasePaymentParam;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->new_()Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "/alipay/pay"

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 12
    .line 13
    iget v1, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 14
    .line 15
    iput v1, v0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 16
    .line 17
    iput-object p3, v0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-virtual {p1, p3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance p3, Ll/pi0;

    .line 32
    .line 33
    invoke-direct {p3, p0, p2, p4, v0}, Ll/pi0;-><init>(Ll/qi0;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p3}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final synthetic p(Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;
    .locals 0

    .line 1
    new-instance p4, Lcom/alipay/sdk/app/PayTask;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qi0;->b:Landroid/app/Activity;

    .line 4
    .line 5
    invoke-direct {p4, p0}, Lcom/alipay/sdk/app/PayTask;-><init>(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-virtual {p4, p1, p0}, Lcom/alipay/sdk/app/PayTask;->payV2(Ljava/lang/String;Z)Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    new-instance p1, Ll/bri0;

    .line 23
    .line 24
    invoke-direct {p1, p2}, Ll/bri0;-><init>(Ll/x20;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const-string p1, "result"

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Ljava/lang/String;

    .line 37
    .line 38
    iput-object p1, p3, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 39
    .line 40
    const-string p1, "resultStatus"

    .line 41
    .line 42
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ljava/lang/CharSequence;

    .line 47
    .line 48
    const-string p1, "9000"

    .line 49
    .line 50
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_1

    .line 55
    .line 56
    sget-object p0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 57
    .line 58
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/api/api/PaymentApi;->b0(Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 64
    .line 65
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/data/Order;Ll/x20;)Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/alipay/sdk/app/PayTask;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qi0;->b:Landroid/app/Activity;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/alipay/sdk/app/PayTask;-><init>(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-virtual {v0, p0, p1}, Lcom/alipay/sdk/app/PayTask;->payV2(Ljava/lang/String;Z)Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    new-instance p1, Ll/bri0;

    .line 25
    .line 26
    invoke-direct {p1, p2}, Ll/bri0;-><init>(Ll/x20;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    const-string p1, "resultStatus"

    .line 33
    .line 34
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/lang/CharSequence;

    .line 39
    .line 40
    const-string p1, "9000"

    .line 41
    .line 42
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 52
    .line 53
    return-object p0
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/data/PurchasePaymentParam;ZLl/x20;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p4, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p4, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 6
    .line 7
    iget v2, v1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0, v2, v1}, Ll/qi0;->B(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p4, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p4, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 19
    .line 20
    iget v2, v1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p1, v0, v2, v1}, Ll/qi0;->A(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p4, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 28
    .line 29
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 30
    .line 31
    const/16 v1, 0xc8

    .line 32
    .line 33
    if-eq v0, v1, :cond_0

    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 36
    .line 37
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    iget-object v0, p4, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 43
    .line 44
    if-eqz p2, :cond_5

    .line 45
    .line 46
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-nez p2, :cond_1

    .line 53
    .line 54
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, p2, p1}, Ll/qi0;->F(Ljava/lang/String;Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    new-instance p1, Ll/mi0;

    .line 61
    .line 62
    invoke-direct {p1}, Ll/mi0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :cond_1
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-nez p2, :cond_2

    .line 77
    .line 78
    iget-object p2, p4, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 79
    .line 80
    iget-object p4, p2, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

    .line 81
    .line 82
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p0, p1, p4, p2, p3}, Ll/qi0;->o(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_2
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 90
    .line 91
    const-string v1, "pending"

    .line 92
    .line 93
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-eqz p2, :cond_3

    .line 98
    .line 99
    iget-object p0, p4, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 102
    .line 103
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 104
    .line 105
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->pending:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 106
    .line 107
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_3
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 113
    .line 114
    const-string v1, "success"

    .line 115
    .line 116
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    if-eqz p2, :cond_4

    .line 121
    .line 122
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 123
    .line 124
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    return-object p0

    .line 129
    :cond_4
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 130
    .line 131
    const-string v1, "failed"

    .line 132
    .line 133
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    if-eqz p2, :cond_5

    .line 138
    .line 139
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 140
    .line 141
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    return-object p0

    .line 146
    :cond_5
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    if-nez p2, :cond_6

    .line 153
    .line 154
    new-instance p1, Ll/ni0;

    .line 155
    .line 156
    invoke-direct {p1, p0, v0, p3}, Ll/ni0;-><init>(Ll/qi0;Lcom/p1/mobile/putong/data/Order;Ll/x20;)V

    .line 157
    .line 158
    .line 159
    invoke-static {p1}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    return-object p0

    .line 164
    :cond_6
    iget-object p2, p4, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 165
    .line 166
    iget-object p4, p2, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

    .line 167
    .line 168
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {p0, p1, p4, p2, p3}, Ll/qi0;->o(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/qi0;->n(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {p2}, Ll/bsj0;->z(Ljava/lang/Throwable;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, ""

    .line 22
    .line 23
    invoke-virtual {p0, p1, v2, v0, v1}, Ll/qi0;->B(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p2}, Ll/bsj0;->z(Ljava/lang/Throwable;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const-string v1, "default"

    .line 35
    .line 36
    invoke-virtual {p0, p1, v1, v0, p2}, Ll/qi0;->A(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic t(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 6
    .line 7
    iget v2, v1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0, v2, v1}, Ll/qi0;->E(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 19
    .line 20
    iget v2, v1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p1, v0, v2, v1}, Ll/qi0;->D(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 28
    .line 29
    iget v1, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 30
    .line 31
    const/16 v2, 0xc8

    .line 32
    .line 33
    if-eq v1, v2, :cond_0

    .line 34
    .line 35
    iget p1, v0, Lcom/p1/mobile/putong/data/Meta;->subCode:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/qi0;->n(I)V

    .line 38
    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 44
    .line 45
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 50
    .line 51
    const-string v0, "signing"

    .line 52
    .line 53
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->signing:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 65
    .line 66
    const-string v0, "success"

    .line 67
    .line 68
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_2
    iget-object p0, p0, Ll/qi0;->b:Landroid/app/Activity;

    .line 78
    .line 79
    iget-object p1, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p0, p1}, Ll/qi0;->G(Landroid/content/Context;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->toSigning:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 87
    .line 88
    return-object p0
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-static {p2}, Ll/bsj0;->z(Ljava/lang/Throwable;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, ""

    .line 10
    .line 11
    invoke-virtual {p0, p1, v2, v0, v1}, Ll/qi0;->E(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Ll/bsj0;->z(Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "default"

    .line 23
    .line 24
    invoke-virtual {p0, p1, v2, v0, v1}, Ll/qi0;->D(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    instance-of p1, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Ll/qi0;->b:Landroid/app/Activity;

    .line 32
    .line 33
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 34
    .line 35
    iget p1, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/qi0;->y(Landroid/app/Activity;I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/data/Order;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/alipay/sdk/app/PayTask;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qi0;->b:Landroid/app/Activity;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/alipay/sdk/app/PayTask;-><init>(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-virtual {v0, p0, p1}, Lcom/alipay/sdk/app/PayTask;->payV2(Ljava/lang/String;Z)Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "resultStatus"

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/CharSequence;

    .line 22
    .line 23
    const-string p1, "9000"

    .line 24
    .line 25
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 35
    .line 36
    return-object p0
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 6
    .line 7
    iget v2, v1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0, v2, v1}, Ll/qi0;->E(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 19
    .line 20
    iget v2, v1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p1, v0, v2, v1}, Ll/qi0;->D(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 28
    .line 29
    iget v1, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 30
    .line 31
    const/16 v2, 0xc8

    .line 32
    .line 33
    if-eq v1, v2, :cond_0

    .line 34
    .line 35
    iget p1, v0, Lcom/p1/mobile/putong/data/Meta;->subCode:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/qi0;->n(I)V

    .line 38
    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 41
    .line 42
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 48
    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 52
    .line 53
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_1

    .line 60
    .line 61
    new-instance p1, Ll/oi0;

    .line 62
    .line 63
    invoke-direct {p1, p0, v0}, Ll/oi0;-><init>(Ll/qi0;Lcom/p1/mobile/putong/data/Order;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_1
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 74
    .line 75
    const-string p1, "success"

    .line 76
    .line 77
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_2

    .line 82
    .line 83
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 86
    .line 87
    const-string p1, "signing"

    .line 88
    .line 89
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 96
    .line 97
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 103
    .line 104
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-static {p2}, Ll/bsj0;->z(Ljava/lang/Throwable;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, ""

    .line 10
    .line 11
    invoke-virtual {p0, p1, v2, v0, v1}, Ll/qi0;->E(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Ll/bsj0;->z(Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "default"

    .line 23
    .line 24
    invoke-virtual {p0, p1, v2, v0, v1}, Ll/qi0;->D(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    instance-of p1, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Ll/qi0;->b:Landroid/app/Activity;

    .line 32
    .line 33
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 34
    .line 35
    iget p1, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/qi0;->y(Landroid/app/Activity;I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final z(Lcom/p1/mobile/putong/data/PaymentParam;)V
    .locals 2

    .line 1
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qi0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "alipay"

    .line 8
    .line 9
    invoke-virtual {v0, p0, p1, v1}, Ll/lib0$a;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
