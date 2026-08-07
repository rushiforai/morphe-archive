.class public Ll/kkq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h2m;
.implements Ll/sol;


# instance fields
.field public a:Lcom/jdpaysdk/author/JDPayAuthor;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p1, p0, Ll/kkq;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    new-instance p1, Lcom/jdpaysdk/author/JDPayAuthor;

    .line 9
    .line 10
    invoke-direct {p1}, Lcom/jdpaysdk/author/JDPayAuthor;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/kkq;->a:Lcom/jdpaysdk/author/JDPayAuthor;

    .line 14
    .line 15
    iput-object p2, p0, Ll/kkq;->c:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic d(Ll/kkq;Ljava/lang/String;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/kkq;->m(Ljava/lang/String;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/kkq;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/kkq;->n(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f(Ll/kkq;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kkq;->l(Ll/gcg0;)V

    return-void
.end method

.method public static synthetic g(Ll/kkq;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kkq;->o(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->b0(Lcom/p1/mobile/putong/data/PaymentParam;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 13
    .line 14
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static bridge synthetic i(Ll/kkq;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kkq;->b:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method private p(Lcom/p1/mobile/putong/data/PaymentParam;)V
    .locals 2

    .line 1
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/kkq;->c:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "jingdong"

    .line 8
    .line 9
    invoke-virtual {v0, p0, p1, v1}, Ll/lib0$a;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private q(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V
    .locals 7

    .line 1
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/kkq;->c:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v3, "jingdong"

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

.method private r(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V
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
    const-string p1, "jingdong"

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


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/SignPaymentParam;)Lrx/c;
    .locals 0
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
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/SignPaymentParam;)Lrx/c;
    .locals 0
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
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
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
    invoke-direct {p0, p1}, Ll/kkq;->p(Lcom/p1/mobile/putong/data/PaymentParam;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "/jingdong/create-order"

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
    new-instance v1, Ll/fkq;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1, p2}, Ll/fkq;-><init>(Ll/kkq;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    new-instance v0, Ll/gkq;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1}, Ll/gkq;-><init>(Ll/kkq;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public final j()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/jkq;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jkq;-><init>(Ll/kkq;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public k(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;
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
    const-string p3, "/jingdong/pay"

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
    new-instance p3, Ll/hkq;

    .line 32
    .line 33
    invoke-direct {p3, p0, p2, v0, p4}, Ll/hkq;-><init>(Ll/kkq;Ljava/lang/String;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;)V

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

.method public final synthetic l(Ll/gcg0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kkq;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/kkq$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/kkq$a;-><init>(Ll/kkq;Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->registerOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic m(Ljava/lang/String;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Lrx/c;
    .locals 7

    .line 1
    :try_start_0
    sget-object p4, Lcom/p1/mobile/putong/core/data/JDPayBill;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {p4, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/JDPayBill;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_0
    move-exception v0

    .line 11
    move-object p1, v0

    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    :goto_0
    const/16 p4, 0xc8

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    const-string p1, ""

    .line 21
    .line 22
    const-string p3, "JDPayBill bill = null;"

    .line 23
    .line 24
    invoke-direct {p0, p2, p1, p4, p3}, Ll/kkq;->r(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 28
    .line 29
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/JDPayBill;->merchant:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/JDPayBill;->appId:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/JDPayBill;->orderId:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/JDPayBill;->signData:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v0, p0, Ll/kkq;->a:Lcom/jdpaysdk/author/JDPayAuthor;

    .line 43
    .line 44
    iget-object v1, p0, Ll/kkq;->b:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    const/4 v6, 0x0

    .line 47
    invoke-virtual/range {v0 .. v6}, Lcom/jdpaysdk/author/JDPayAuthor;->author(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p2, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 51
    .line 52
    const-string v0, "OK"

    .line 53
    .line 54
    invoke-direct {p0, p2, p1, p4, v0}, Ll/kkq;->r(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    new-instance p1, Ll/bri0;

    .line 67
    .line 68
    invoke-direct {p1, p3}, Ll/bri0;-><init>(Ll/x20;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    invoke-virtual {p0}, Ll/kkq;->j()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    new-instance p1, Ll/ikq;

    .line 87
    .line 88
    invoke-direct {p1, p2}, Ll/ikq;-><init>(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;
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
    invoke-direct {p0, p1, v0, v2, v1}, Ll/kkq;->q(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

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
    invoke-direct {p0, p1, p2, v1, p3}, Ll/kkq;->r(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

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
    invoke-virtual {p0, p1, v0, p3, p2}, Ll/kkq;->k(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/Throwable;)V
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
    invoke-direct {p0, p1, v2, v0, v1}, Ll/kkq;->r(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

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
    invoke-direct {p0, p1, v1, v0, p2}, Ll/kkq;->q(Lcom/p1/mobile/putong/data/PaymentParam;Ljava/lang/String;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
