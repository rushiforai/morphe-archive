.class public Ll/nd9;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Z

.field public S:Z

.field public T:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public U:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

.field public W:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public X:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/nd9;->R:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/nd9;->S:Z

    .line 8
    .line 9
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/nd9;->T:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/nd9;->U:Lrx/subjects/a;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    iput-object p1, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 25
    .line 26
    new-instance p1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/nd9;->W:Ljava/util/ArrayList;

    .line 32
    .line 33
    new-instance p1, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/nd9;->X:Ljava/util/ArrayList;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic a3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/gd9;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gd9;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/data/WebSubscriptionLandPageEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic b3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/md9;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/md9;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/qi20;->f(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic d3(Ll/nd9;Lcom/p1/mobile/putong/core/data/IntlInnerWebPayEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nd9;->s3(Lcom/p1/mobile/putong/core/data/IntlInnerWebPayEnvelope;)V

    return-void
.end method

.method public static synthetic e3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;->toJson()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic f3(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic g3(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic h3(Ll/nd9;Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nd9;->r3(Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;)V

    return-void
.end method

.method public static synthetic i3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/ld9;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ld9;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic j3(Ll/nd9;Lcom/p1/mobile/putong/core/data/IntlWebPay;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nd9;->t3(Lcom/p1/mobile/putong/core/data/IntlWebPay;)V

    return-void
.end method


# virtual methods
.method public k3(Lcom/p1/mobile/putong/core/data/NativeConfig;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/NativeConfig;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->method:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "nativeMethod"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NativeConfig;->defaultQueryType:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "order"

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->i0()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, "/create-order"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->i0()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v1, "/create-contract"

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;->new_()Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iput-object p2, v1, Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;->membershipType:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    iput p2, v1, Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;->quantity:I

    .line 82
    .line 83
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/NativeConfig;->platform:Ljava/lang/String;

    .line 84
    .line 85
    iput-object p2, v1, Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;->platform:Ljava/lang/String;

    .line 86
    .line 87
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/NativeConfig;->currencyCode:Ljava/lang/String;

    .line 88
    .line 89
    iput-object p2, v1, Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;->currencyCode:Ljava/lang/String;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NativeConfig;->payType:Ljava/lang/String;

    .line 92
    .line 93
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;->payType:Ljava/lang/String;

    .line 94
    .line 95
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    new-instance p1, Ll/kd9;

    .line 98
    .line 99
    invoke-direct {p1, v0, v1}, Ll/kd9;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IntlRequestWebPayPayment;)V

    .line 100
    .line 101
    .line 102
    const-string p2, "createPayment"

    .line 103
    .line 104
    const/4 p3, -0x1

    .line 105
    invoke-virtual {p0, p2, p3, p1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0

    .line 118
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 119
    return-object p0
.end method

.method public l3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/WebSubscriptionLandPageEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->v()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    new-instance v1, Ll/dd9;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ll/dd9;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "getCheckoutContractConfig"

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {p0, v0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public m3()Lcom/p1/mobile/putong/core/data/NativeConfig;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->method:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "nativeMethod"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->nativeConfigs:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->nativeConfigs:Ljava/util/List;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/core/data/NativeConfig;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public n3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/IntlInnerWebPayEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "huawei"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "googleplay"

    .line 11
    .line 12
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->i0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, "/method?language="

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, "&affiliate="

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    new-instance v1, Ll/jd9;

    .line 51
    .line 52
    invoke-direct {v1, v0}, Ll/jd9;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-string v0, "intlWebPayConfig"

    .line 56
    .line 57
    const/4 v2, 0x0

    .line 58
    invoke-virtual {p0, v0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public o3()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 13
    .line 14
    iget-object p0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 15
    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_1
    const-string v1, "nativeMethod"

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->method:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/nd9;->m3()Lcom/p1/mobile/putong/core/data/NativeConfig;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NativeConfig;->btnDesc:Ljava/lang/String;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 46
    .line 47
    iget-object p0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->thirdPartConfig:Lcom/p1/mobile/putong/core/data/ThirdPartConfig;

    .line 50
    .line 51
    if-nez p0, :cond_4

    .line 52
    .line 53
    return-object v0

    .line 54
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ThirdPartConfig;->text:Ljava/lang/String;

    .line 55
    .line 56
    return-object p0
.end method

.method public p3()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nd9;->T:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->method:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "nativeMethod"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->method:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "thirdPartMethod"

    .line 46
    .line 47
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    :cond_0
    iget-boolean v0, p0, Ll/nd9;->S:Z

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object p0, p0, Ll/nd9;->X:Ljava/util/ArrayList;

    .line 58
    .line 59
    sget v0, Ll/uqb0;->f0:I

    .line 60
    .line 61
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_1

    .line 70
    .line 71
    const/4 p0, 0x1

    .line 72
    return p0

    .line 73
    :cond_1
    const/4 p0, 0x0

    .line 74
    return p0
.end method

.method public q3()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nd9;->p3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->method:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "nativeMethod"

    .line 12
    .line 13
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final synthetic r3(Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;->android:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/nd9;->S:Z

    .line 4
    .line 5
    iget-object v0, p0, Ll/nd9;->X:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/nd9;->X:Ljava/util/ArrayList;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;->reverse_mcc:Ljava/util/List;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic s3(Lcom/p1/mobile/putong/core/data/IntlInnerWebPayEnvelope;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 2
    .line 3
    iput-object p1, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 4
    .line 5
    iget-object p0, p0, Ll/nd9;->U:Lrx/subjects/a;

    .line 6
    .line 7
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic t3(Lcom/p1/mobile/putong/core/data/IntlWebPay;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/IntlWebPay;->intlWebPayValid:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/nd9;->R:Z

    .line 4
    .line 5
    iget-object v0, p0, Ll/nd9;->W:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/nd9;->W:Ljava/util/ArrayList;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlWebPay;->intlWebPayBlackList:Ljava/util/List;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public u3()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 4
    .line 5
    iget-object v0, v0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/nd9;->m3()Lcom/p1/mobile/putong/core/data/NativeConfig;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NativeConfig;->redirectType:Ljava/lang/String;

    .line 20
    .line 21
    return-object p0
.end method

.method public final v3()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "intl_pay_penetration"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :try_start_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;->nullCheck()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;->new_()Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :goto_0
    new-instance v1, Ll/hd9;

    .line 34
    .line 35
    invoke-direct {v1, p0, v0}, Ll/hd9;-><init>(Ll/nd9;Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catch_0
    move-exception p0

    .line 43
    new-instance v0, Ljava/io/IOException;

    .line 44
    .line 45
    const-string v1, "intl web pay catch json parse Exception, please ignore. "

    .line 46
    .line 47
    invoke-direct {v0, v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public w3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/nd9;->x3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nd9;->v3()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nd9;->n3()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/ed9;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/ed9;-><init>(Ll/nd9;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/fd9;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/fd9;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final x3()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/nd9;->R:Z

    .line 9
    .line 10
    iget-object p0, p0, Ll/nd9;->W:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "intl_web_pay"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :try_start_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/IntlWebPay;->parse(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/IntlWebPay;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/id9;

    .line 31
    .line 32
    invoke-direct {v1, p0, v0}, Ll/id9;-><init>(Ll/nd9;Lcom/p1/mobile/putong/core/data/IntlWebPay;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    new-instance v0, Ljava/io/IOException;

    .line 41
    .line 42
    const-string v1, "intl web pay catch json parse Exception, please ignore. "

    .line 43
    .line 44
    invoke-direct {v0, v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public y3()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 4
    .line 5
    iget-object p0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->subscriptionHomePage:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method
