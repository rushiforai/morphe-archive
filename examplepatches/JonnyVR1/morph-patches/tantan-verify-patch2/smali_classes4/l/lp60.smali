.class public Ll/lp60;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
        ">;"
    }
.end annotation


# instance fields
.field public final e:Lcom/p1/mobile/android/app/Act;

.field public final f:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/peb0;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/bn50;

.field public i:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

.field public j:Ll/peb0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y20;Ll/peb0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Ll/y20<",
            "Ll/peb0;",
            ">;",
            "Ll/peb0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lp60;->e:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lp60;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    iput-object p3, p0, Ll/lp60;->g:Ll/y20;

    .line 9
    .line 10
    iput-object p4, p0, Ll/lp60;->j:Ll/peb0;

    .line 11
    .line 12
    iget-object p1, p4, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 13
    .line 14
    iput-object p1, p0, Ll/lp60;->i:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic g(Ll/lp60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lp60;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h()V
    .locals 1

    .line 1
    invoke-static {}, Ll/bn60;->N()V

    .line 2
    .line 3
    .line 4
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->K7:I

    .line 5
    .line 6
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic i(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lp60;->i:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 4
    .line 5
    return p0
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/xl60;->o()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p1, "e_purchase_retry_button"

    .line 8
    .line 9
    const-string v0, "p_purchase_pay_fail_page"

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/lp60;->g:Ll/y20;

    .line 15
    .line 16
    iget-object p0, p0, Ll/lp60;->j:Ll/peb0;

    .line 17
    .line 18
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/lp60;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v0, Ll/ip60;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/ip60;-><init>()V

    .line 6
    .line 7
    .line 8
    const-wide/16 v1, 0x7d0

    .line 9
    .line 10
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/lp60;->e:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/lp60;->j()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 14
    .line 15
    if-ne p1, v1, :cond_3

    .line 16
    .line 17
    iget-object v1, p0, Ll/lp60;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    invoke-static {v1}, Ll/fp60;->C(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/lp60;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 23
    .line 24
    const-string v2, ""

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/fp60;->D(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/lp60;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {v1}, Ll/xl60;->B(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/lp60;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 37
    .line 38
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-static {}, Ll/bn60;->N()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {p0}, Ll/lp60;->l()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-static {v1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/joa;->y4()Lrx/c;

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/lp60;->h:Ll/bn50;

    .line 66
    .line 67
    invoke-interface {v0}, Ll/bn50;->c()V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 72
    .line 73
    if-ne p1, v1, :cond_5

    .line 74
    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    iget-object v0, p0, Ll/lp60;->e:Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    invoke-static {v0}, Ll/bn60;->T(Lcom/p1/mobile/android/app/Act;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/lp60;->h:Ll/bn50;

    .line 83
    .line 84
    invoke-interface {v0}, Ll/bn50;->a()V

    .line 85
    .line 86
    .line 87
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->C3()Lrx/c;

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    invoke-virtual {p0}, Ll/lp60;->o()V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->toSigning:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 100
    .line 101
    if-ne p1, v0, :cond_6

    .line 102
    .line 103
    invoke-static {}, Ll/bn60;->N()V

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->pending:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 108
    .line 109
    if-ne p1, v0, :cond_7

    .line 110
    .line 111
    iget-object v0, p0, Ll/lp60;->i:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 112
    .line 113
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 114
    .line 115
    new-instance v2, Ll/fj1;

    .line 116
    .line 117
    const/4 v3, 0x0

    .line 118
    iget-object v4, p0, Ll/lp60;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 119
    .line 120
    invoke-direct {v2, v0, v3, v4}, Ll/fj1;-><init>(Lcom/p1/mobile/putong/data/PaymentParam;ZLcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v1, v2}, Ll/fp60;->H(Ljava/lang/String;Ll/fj1;)V

    .line 124
    .line 125
    .line 126
    :cond_7
    :goto_1
    invoke-static {}, Ll/qk60;->b()Ll/qk60;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-object v1, p0, Ll/lp60;->j:Ll/peb0;

    .line 131
    .line 132
    iget-object p0, p0, Ll/lp60;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 133
    .line 134
    invoke-virtual {v0, v1, p0, p1}, Ll/qk60;->a(Ll/peb0;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)Z

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public n(Ll/bn50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lp60;->h:Ll/bn50;

    .line 2
    .line 3
    return-void
.end method

.method public o()V
    .locals 9

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_purchase_pay_fail_page"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 16
    .line 17
    .line 18
    :try_start_0
    const-string v0, "errorName"

    .line 19
    .line 20
    const-string v3, ""

    .line 21
    .line 22
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 23
    .line 24
    .line 25
    const-string v3, "passive"

    .line 26
    .line 27
    const-string v4, "alert"

    .line 28
    .line 29
    const-string v5, "alert_system"

    .line 30
    .line 31
    const-string v6, "purchase_button"

    .line 32
    .line 33
    const-string v7, "purchase_page"

    .line 34
    .line 35
    const-string v8, "pay_fail"

    .line 36
    .line 37
    invoke-static/range {v2 .. v8}, Ll/i6e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const-string v0, "category"

    .line 41
    .line 42
    iget-object v3, p0, Ll/lp60;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    const-string v0, "purchase_id"

    .line 56
    .line 57
    iget-object v3, p0, Ll/lp60;->i:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 58
    .line 59
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v2}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catch_0
    move-exception v0

    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    new-instance v0, Ll/th0$a;

    .line 75
    .line 76
    iget-object v2, p0, Ll/lp60;->e:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    invoke-direct {v0, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Ll/lp60;->e:Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->V9:I

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v0, v2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v2, p0, Ll/lp60;->e:Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->T9:I

    .line 96
    .line 97
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v0, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->U9:I

    .line 106
    .line 107
    invoke-virtual {v0, v2}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v2, Ll/jp60;

    .line 112
    .line 113
    invoke-direct {v2, p0}, Ll/jp60;-><init>(Ll/lp60;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->a:I

    .line 121
    .line 122
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    new-instance v0, Ll/kp60;

    .line 127
    .line 128
    invoke-direct {v0, v1}, Ll/kp60;-><init>(Ll/l4g0;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v0}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 140
    .line 141
    .line 142
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public onCompleted()V
    .locals 0

    .line 1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p1, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "alipay"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->S9:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/lp60;->e:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/lp60;->h:Ll/bn50;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget-object p0, p0, Ll/lp60;->h:Ll/bn50;

    .line 49
    .line 50
    invoke-interface {p0}, Ll/bn50;->a()V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lp60;->m(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
