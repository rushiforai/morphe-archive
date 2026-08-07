.class public Ll/vci0;
.super Ll/wc00;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/wc00;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Ll/vci0;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vci0;->W(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static synthetic L(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M(Ll/vci0;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vci0;->Z(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic N(Ll/vci0;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/vci0;->a0(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic O(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P(Ll/vci0;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/vci0;->Y(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lorg/json/JSONObject;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic R(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/ueh0;->g()Ll/ueh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ueh0;->c()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic S(Ll/vci0;Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vci0;->X(Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic U(Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 2

    .line 1
    const-string v0, "wechat"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    new-instance v0, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    const-string v1, "paymentMethods"

    .line 13
    .line 14
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    :catch_0
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const-string v0, "\""

    .line 30
    .line 31
    const-string v1, "\\\""

    .line 32
    .line 33
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    filled-new-array {p2}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-interface {p0, p1, p2}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public final V(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 4

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "paymentMethods"

    .line 8
    .line 9
    const-string v2, "0"

    .line 10
    .line 11
    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    new-instance v1, Ll/bo60;

    .line 22
    .line 23
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    invoke-direct {v1, p0, v3}, Ll/bo60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    const-string p0, "alipay"

    .line 37
    .line 38
    invoke-static {p0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string p0, "wechat"

    .line 44
    .line 45
    invoke-static {p0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    :goto_0
    invoke-virtual {v1, p0}, Ll/bo60;->r(Lcom/p1/mobile/putong/data/PayMethod;)Ll/bo60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p2, Ll/kci0;

    .line 54
    .line 55
    invoke-direct {p2, p1, v0}, Ll/kci0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p2}, Ll/bo60;->q(Ll/y20;)Ll/bo60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/bo60;->s()V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public final synthetic W(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/wc00;->F(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic X(Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    new-instance v0, Ll/lci0;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/lci0;-><init>(Ll/vci0;Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 p0, 0x3e8

    .line 9
    .line 10
    invoke-static {p2, v0, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic Y(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lorg/json/JSONObject;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    new-instance v3, Ll/oci0;

    .line 4
    .line 5
    invoke-direct {v3, p0, p3}, Ll/oci0;-><init>(Ll/vci0;Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    const/4 v5, 0x0

    .line 9
    const/4 v6, 0x0

    .line 10
    const/4 v4, 0x0

    .line 11
    move-object v1, p1

    .line 12
    move-object v2, p2

    .line 13
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->R0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_3

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 24
    .line 25
    invoke-static {v0}, Ll/wib0;->b(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    new-instance v1, Ll/wn60;

    .line 36
    .line 37
    iget-object v2, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    const-string v3, ""

    .line 40
    .line 41
    invoke-direct {v1, v0, v2, v3, v3}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-nez v2, :cond_0

    .line 49
    .line 50
    invoke-virtual {v1, p2}, Ll/wn60;->C(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ll/pzi0;->o()J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-static {p2}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-virtual {v1, p2}, Ll/wn60;->C(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :goto_0
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 89
    .line 90
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-nez p2, :cond_1

    .line 95
    .line 96
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 97
    .line 98
    const/4 v2, 0x0

    .line 99
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    check-cast p2, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 104
    .line 105
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p2}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-nez p2, :cond_1

    .line 112
    .line 113
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    check-cast p2, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 120
    .line 121
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v1, p2}, Ll/wn60;->r(Ljava/lang/String;)Ll/wn60;

    .line 124
    .line 125
    .line 126
    :cond_1
    const-string p2, "1"

    .line 127
    .line 128
    invoke-static {p3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 133
    .line 134
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 135
    .line 136
    new-instance p3, Ll/pci0;

    .line 137
    .line 138
    invoke-direct {p3}, Ll/pci0;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1, p2, p1, p3}, Ll/wn60;->I(ZLjava/lang/String;Ll/y20;)V

    .line 142
    .line 143
    .line 144
    invoke-static {}, Ll/ueh0;->g()Ll/ueh0;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget-object p1, p1, Ll/ueh0;->c:Ll/kcg0;

    .line 149
    .line 150
    if-eqz p1, :cond_2

    .line 151
    .line 152
    invoke-interface {p1}, Ll/kcg0;->isUnsubscribed()Z

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    if-eqz p2, :cond_3

    .line 157
    .line 158
    :cond_2
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 159
    .line 160
    .line 161
    invoke-static {}, Ll/ueh0;->g()Ll/ueh0;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    iget-object p2, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 166
    .line 167
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object p3

    .line 171
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    new-instance p3, Ll/qci0;

    .line 176
    .line 177
    invoke-direct {p3, v0}, Ll/qci0;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p2, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    const/4 p3, 0x1

    .line 185
    invoke-virtual {p2, p3}, Lrx/c;->take(I)Lrx/c;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    new-instance p3, Ll/rci0;

    .line 190
    .line 191
    invoke-direct {p3, p0}, Ll/rci0;-><init>(Ll/vci0;)V

    .line 192
    .line 193
    .line 194
    new-instance v0, Ll/sci0;

    .line 195
    .line 196
    invoke-direct {v0}, Ll/sci0;-><init>()V

    .line 197
    .line 198
    .line 199
    invoke-static {p3, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 200
    .line 201
    .line 202
    move-result-object p3

    .line 203
    invoke-virtual {p2, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 204
    .line 205
    .line 206
    move-result-object p2

    .line 207
    iput-object p2, p1, Ll/ueh0;->c:Ll/kcg0;

    .line 208
    .line 209
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 210
    .line 211
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    new-instance p1, Ll/tci0;

    .line 216
    .line 217
    invoke-direct {p1}, Ll/tci0;-><init>()V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    new-instance p1, Ll/uci0;

    .line 225
    .line 226
    invoke-direct {p1}, Ll/uci0;-><init>()V

    .line 227
    .line 228
    .line 229
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 234
    .line 235
    .line 236
    :cond_3
    return-void
.end method

.method public final b0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    const-string p1, "from"

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "privilege"

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "roamingLocation"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->youth_roaming:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v1, "findPartner"

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->youth_find_partner:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string v1, "blindBox"

    .line 36
    .line 37
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->youth_blind_box:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const-string v1, "superlike"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->youth_superlike:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const-string v1, "messageReadStatus"

    .line 58
    .line 59
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->youth_message_read:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->youth_roaming:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 69
    .line 70
    :goto_0
    iget-object v1, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 71
    .line 72
    new-instance v2, Ll/mci0;

    .line 73
    .line 74
    invoke-direct {v2, p0, p1, v0, p2}, Ll/mci0;-><init>(Ll/vci0;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lorg/json/JSONObject;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final c0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    const-string p1, "paymentMethods"

    .line 2
    .line 3
    const-string v0, "0"

    .line 4
    .line 5
    invoke-virtual {p2, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "merchandiseId"

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "purchaseId"

    .line 16
    .line 17
    const-string v2, ""

    .line 18
    .line 19
    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {v0}, Ll/ueh0;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    new-instance v2, Ll/nci0;

    .line 37
    .line 38
    invoke-direct {v2, p0, v0, p2, p1}, Ll/nci0;-><init>(Ll/vci0;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public v(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch p2, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
    const-string p2, "jumpToPayment"

    .line 16
    .line 17
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x5

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string p2, "paymentMethodChanges"

    .line 27
    .line 28
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-nez p2, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v2, 0x4

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string p2, "hasYouthVipPrivilege"

    .line 38
    .line 39
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v2, 0x3

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    const-string p2, "showYouthVipPurchase"

    .line 49
    .line 50
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-nez p2, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const/4 v2, 0x2

    .line 58
    goto :goto_0

    .line 59
    :sswitch_4
    const-string p2, "getInstantChatNumConfig"

    .line 60
    .line 61
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-nez p2, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    move v2, v1

    .line 69
    goto :goto_0

    .line 70
    :sswitch_5
    const-string p2, "getCurrencyType"

    .line 71
    .line 72
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-nez p2, :cond_5

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_5
    move v2, v0

    .line 80
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 81
    .line 82
    .line 83
    return v0

    .line 84
    :pswitch_0
    invoke-virtual {p0, p1, p4}, Ll/vci0;->c0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 85
    .line 86
    .line 87
    return v1

    .line 88
    :pswitch_1
    invoke-virtual {p0, p1, p4}, Ll/vci0;->V(Ll/xc00;Lorg/json/JSONObject;)V

    .line 89
    .line 90
    .line 91
    return v1

    .line 92
    :pswitch_2
    invoke-static {}, Ll/joa;->P3()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_6

    .line 97
    .line 98
    const-string p1, "1"

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_6
    const-string p1, "0"

    .line 102
    .line 103
    :goto_1
    invoke-virtual {p0, p4, p1}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return v1

    .line 107
    :pswitch_3
    invoke-virtual {p0, p1, p4}, Ll/vci0;->b0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 108
    .line 109
    .line 110
    return v1

    .line 111
    :pswitch_4
    invoke-static {}, Ll/c690;->a()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, p4, p1}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return v1

    .line 123
    :pswitch_5
    new-instance p1, Lorg/json/JSONObject;

    .line 124
    .line 125
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 126
    .line 127
    .line 128
    :try_start_0
    const-string p2, "currencyType"

    .line 129
    .line 130
    sget-object p3, Ll/uqb0;->D0:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p0, p4, p1}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :catch_0
    move-exception p0

    .line 144
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 145
    .line 146
    .line 147
    :goto_2
    return v1

    .line 148
    nop

    .line 149
    :sswitch_data_0
    .sparse-switch
        -0x6321ea9f -> :sswitch_5
        -0x5c3c35fb -> :sswitch_4
        -0x5a75d778 -> :sswitch_3
        0x1e2f1a0d -> :sswitch_2
        0x61d3923c -> :sswitch_1
        0x715e8a7d -> :sswitch_0
    .end sparse-switch

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
