.class public Ll/nop0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h2m;
.implements Ll/sol;


# instance fields
.field public a:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {p1, v0}, Lcom/tencent/mm/opensdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/nop0;->a:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 10
    .line 11
    const-string v0, "wxd5aa78216c5e54bc"

    .line 12
    .line 13
    invoke-interface {p1, v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->registerApp(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/nop0;->b:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic d(Ll/nop0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/nop0;->o(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e(Ll/nop0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nop0;->s(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f(Ll/nop0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nop0;->q(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g(Ll/nop0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nop0;->r(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(Ll/nop0;Ljava/lang/String;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/nop0;->m(Ljava/lang/String;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Lcom/p1/mobile/putong/data/Order;)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreProduct;->f0:Z

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 9
    .line 10
    const-string v1, "purchased"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 19
    .line 20
    const-string v0, "assumedPurchased"

    .line 21
    .line 22
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 30
    .line 31
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_1
    :goto_0
    sget-object p1, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->b0(Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static synthetic j(Ll/nop0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/nop0;->n(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Ll/nop0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nop0;->p(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    move-result-object p0

    return-object p0
.end method

.method private synthetic m(Ljava/lang/String;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;
    .locals 2

    .line 1
    :try_start_0
    sget-object p4, Lcom/p1/mobile/putong/core/data/Bill;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {p4, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/Bill;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_0
    move-exception p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    :goto_0
    const/16 p4, 0xc8

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const-string p1, ""

    .line 20
    .line 21
    const-string p3, "Bill bill = null;"

    .line 22
    .line 23
    invoke-direct {p0, p2, p1, p4, p3}, Ll/nop0;->v(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 27
    .line 28
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    new-instance v0, Lcom/tencent/mm/opensdk/modelpay/PayReq;

    .line 34
    .line 35
    invoke-direct {v0}, Lcom/tencent/mm/opensdk/modelpay/PayReq;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Bill;->appid:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelpay/PayReq;->appId:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Bill;->partner:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelpay/PayReq;->partnerId:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Bill;->prepay:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelpay/PayReq;->prepayId:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Bill;->packageValue:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelpay/PayReq;->packageValue:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Bill;->noncestr:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelpay/PayReq;->nonceStr:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Bill;->timestamp:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelpay/PayReq;->timeStamp:Ljava/lang/String;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Bill;->sign:Ljava/lang/String;

    .line 63
    .line 64
    iput-object p1, v0, Lcom/tencent/mm/opensdk/modelpay/PayReq;->sign:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p1, p0, Ll/nop0;->a:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 67
    .line 68
    invoke-interface {p1, v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/opensdk/modelbase/BaseReq;)Z

    .line 69
    .line 70
    .line 71
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 74
    .line 75
    const/4 v0, 0x1

    .line 76
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/api/CoreProduct;->f0:Z

    .line 77
    .line 78
    iget-object p1, p2, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 79
    .line 80
    const-string v0, "OK"

    .line 81
    .line 82
    invoke-direct {p0, p2, p1, p4, v0}, Ll/nop0;->v(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_1

    .line 90
    .line 91
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    new-instance p0, Ll/bri0;

    .line 95
    .line 96
    invoke-direct {p0, p3}, Ll/bri0;-><init>(Ll/x20;)V

    .line 97
    .line 98
    .line 99
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    sget-object p0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->Y()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    new-instance p1, Ll/mop0;

    .line 117
    .line 118
    invoke-direct {p1, p2}, Ll/mop0;-><init>(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, p1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0
.end method

.method private synthetic n(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p3, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 6
    .line 7
    iget v2, v1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0, p1, v0, v2, v1}, Ll/nop0;->u(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p3, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 15
    .line 16
    iget v1, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 17
    .line 18
    const/16 v2, 0xc8

    .line 19
    .line 20
    if-eq v1, v2, :cond_0

    .line 21
    .line 22
    const-string p2, ""

    .line 23
    .line 24
    iget-object p3, v0, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 25
    .line 26
    invoke-direct {p0, p1, p2, v1, p3}, Ll/nop0;->v(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 30
    .line 31
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    iget-object p3, p3, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 37
    .line 38
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, p1, v0, p3, p2}, Ll/nop0;->l(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method private synthetic o(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/Throwable;)V
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
    invoke-direct {p0, p1, v2, v0, v1}, Ll/nop0;->v(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

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
    move-result-object p2

    .line 22
    const-string v1, "default"

    .line 23
    .line 24
    invoke-direct {p0, p1, v1, v0, p2}, Ll/nop0;->u(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private t(Lcom/p1/mobile/putong/data/PaymentParam;)V
    .locals 2

    .line 1
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/nop0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "wechat"

    .line 8
    .line 9
    invoke-virtual {v0, p0, p1, v1}, Ll/lib0$a;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private u(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V
    .locals 7

    .line 1
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nop0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v3, "wechat"

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

.method private v(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V
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
    const-string p1, "wechat"

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
    const-string p1, "e_purchase_order_response"

    .line 52
    .line 53
    const-string p2, "p_purchase_page"

    .line 54
    .line 55
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private w(Lcom/p1/mobile/putong/data/PaymentParam;)V
    .locals 2

    .line 1
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/nop0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "wechat"

    .line 8
    .line 9
    invoke-virtual {v0, p0, p1, v1}, Ll/lib0$a;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private x(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V
    .locals 7

    .line 1
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nop0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v3, "wechat"

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

.method private y(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V
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
    const-string p1, "wechat"

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
    const-string p1, "e_purchase_order_response"

    .line 52
    .line 53
    const-string p2, "p_purchase_page"

    .line 54
    .line 55
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
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
    invoke-direct {p0, p1}, Ll/nop0;->w(Lcom/p1/mobile/putong/data/PaymentParam;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "/wechat/contract/signAndPay"

    .line 5
    .line 6
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

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
    new-instance v1, Ll/hop0;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/hop0;-><init>(Ll/nop0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/iop0;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/iop0;-><init>(Ll/nop0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

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
    invoke-direct {p0, p1}, Ll/nop0;->w(Lcom/p1/mobile/putong/data/PaymentParam;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "/wechat/contract/sign"

    .line 5
    .line 6
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

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
    new-instance v1, Ll/jop0;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/jop0;-><init>(Ll/nop0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/kop0;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/kop0;-><init>(Ll/nop0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

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
    .locals 2
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
    iget-object v0, p0, Ll/nop0;->a:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->isWXAppInstalled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Y9:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const-string v0, "/wechat/create-order"

    .line 21
    .line 22
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ll/nop0;->t(Lcom/p1/mobile/putong/data/PaymentParam;)V

    .line 25
    .line 26
    .line 27
    sget-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->V(Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/fop0;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1, p2}, Ll/fop0;-><init>(Ll/nop0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/gop0;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1}, Ll/gop0;-><init>(Ll/nop0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public l(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;
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
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 8
    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 10
    .line 11
    iput v1, v0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 12
    .line 13
    iput-object p3, v0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 14
    .line 15
    const-string p3, "/wechat/pay"

    .line 16
    .line 17
    iput-object p3, v0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

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
    new-instance p3, Ll/lop0;

    .line 32
    .line 33
    invoke-direct {p3, p0, p2, v0, p4}, Ll/lop0;-><init>(Ll/nop0;Ljava/lang/String;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;)V

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

.method public final synthetic p(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
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
    invoke-direct {p0, p1, v0, v2, v1}, Ll/nop0;->y(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

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
    invoke-direct {p0, p1, v0, v2, v1}, Ll/nop0;->x(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

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
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 43
    .line 44
    new-instance p1, Lcom/tencent/mm/opensdk/modelbiz/OpenWebview$Req;

    .line 45
    .line 46
    invoke-direct {p1}, Lcom/tencent/mm/opensdk/modelbiz/OpenWebview$Req;-><init>()V

    .line 47
    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 52
    .line 53
    iput-object p2, p1, Lcom/tencent/mm/opensdk/modelbiz/OpenWebview$Req;->url:Ljava/lang/String;

    .line 54
    .line 55
    iget-object p0, p0, Ll/nop0;->a:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 56
    .line 57
    invoke-interface {p0, p1}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/opensdk/modelbase/BaseReq;)Z

    .line 58
    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->toSigning:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 61
    .line 62
    return-object p0
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V
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
    invoke-direct {p0, p1, v2, v0, v1}, Ll/nop0;->y(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

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
    move-result-object p2

    .line 22
    const-string v1, "default"

    .line 23
    .line 24
    invoke-direct {p0, p1, v1, v0, p2}, Ll/nop0;->x(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
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
    invoke-direct {p0, p1, v0, v2, v1}, Ll/nop0;->y(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

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
    invoke-direct {p0, p1, v0, v2, v1}, Ll/nop0;->x(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OrderData;->meta:Lcom/p1/mobile/putong/data/Meta;

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
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OrderData;->data:Lcom/p1/mobile/putong/data/Order;

    .line 39
    .line 40
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 43
    .line 44
    :try_start_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/Bill;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 45
    .line 46
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/data/Bill;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catch_0
    move-exception p1

    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    :goto_0
    if-nez p1, :cond_1

    .line 61
    .line 62
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->toSigning:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_1
    new-instance p2, Lcom/tencent/mm/opensdk/modelpay/PayReq;

    .line 66
    .line 67
    invoke-direct {p2}, Lcom/tencent/mm/opensdk/modelpay/PayReq;-><init>()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bill;->appid:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v0, p2, Lcom/tencent/mm/opensdk/modelpay/PayReq;->appId:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bill;->partner:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v0, p2, Lcom/tencent/mm/opensdk/modelpay/PayReq;->partnerId:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bill;->prepay:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v0, p2, Lcom/tencent/mm/opensdk/modelpay/PayReq;->prepayId:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bill;->packageValue:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v0, p2, Lcom/tencent/mm/opensdk/modelpay/PayReq;->packageValue:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bill;->noncestr:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v0, p2, Lcom/tencent/mm/opensdk/modelpay/PayReq;->nonceStr:Ljava/lang/String;

    .line 89
    .line 90
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bill;->timestamp:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v0, p2, Lcom/tencent/mm/opensdk/modelpay/PayReq;->timeStamp:Ljava/lang/String;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Bill;->sign:Ljava/lang/String;

    .line 95
    .line 96
    iput-object p1, p2, Lcom/tencent/mm/opensdk/modelpay/PayReq;->sign:Ljava/lang/String;

    .line 97
    .line 98
    iget-object p0, p0, Ll/nop0;->a:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 99
    .line 100
    invoke-interface {p0, p2}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/opensdk/modelbase/BaseReq;)Z

    .line 101
    .line 102
    .line 103
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->toSigning:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 104
    .line 105
    return-object p0
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V
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
    invoke-direct {p0, p1, v2, v0, v1}, Ll/nop0;->y(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

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
    move-result-object p2

    .line 22
    const-string v1, "default"

    .line 23
    .line 24
    invoke-direct {p0, p1, v1, v0, p2}, Ll/nop0;->x(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
