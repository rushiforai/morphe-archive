.class public Ll/sdf0;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;",
        ">;"
    }
.end annotation


# instance fields
.field public final e:Lcom/p1/mobile/android/app/Act;

.field public final f:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public g:Ll/mdf0;

.field public h:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

.field public i:Z

.field public final j:Z

.field public final k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/mdf0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;ZLl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Ll/mdf0;",
            "Z",
            "Ll/y20<",
            "Ll/mdf0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sdf0;->e:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/sdf0;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    iput-object p3, p0, Ll/sdf0;->g:Ll/mdf0;

    .line 9
    .line 10
    iget-object p1, p3, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 11
    .line 12
    iput-object p1, p0, Ll/sdf0;->h:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 13
    .line 14
    iget-boolean p1, p3, Ll/mdf0;->c:Z

    .line 15
    .line 16
    iput-boolean p1, p0, Ll/sdf0;->i:Z

    .line 17
    .line 18
    iput-boolean p4, p0, Ll/sdf0;->j:Z

    .line 19
    .line 20
    iput-object p5, p0, Ll/sdf0;->k:Ll/y20;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic g(Ll/sdf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sdf0;->j(Landroid/view/View;)V

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
.method public final synthetic j(Landroid/view/View;)V
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
    iget-object p1, p0, Ll/sdf0;->k:Ll/y20;

    .line 15
    .line 16
    iget-object p0, p0, Ll/sdf0;->g:Ll/mdf0;

    .line 17
    .line 18
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 5
    .line 6
    if-ne p1, v0, :cond_1

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/sdf0;->j:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/sdf0;->l()V

    .line 13
    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    iget-boolean v0, p0, Ll/sdf0;->i:Z

    .line 18
    .line 19
    if-nez v0, :cond_9

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->P1:I

    .line 22
    .line 23
    invoke-static {v0}, Ll/o1j0;->n(I)V

    .line 24
    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->signing:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    if-ne p1, v0, :cond_4

    .line 32
    .line 33
    iget-object v0, p0, Ll/sdf0;->h:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 34
    .line 35
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->delayCharge:Z

    .line 36
    .line 37
    if-eqz v2, :cond_3

    .line 38
    .line 39
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->K4()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p0, p0, Ll/sdf0;->e:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    invoke-interface {p1, p0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vn(Ll/ner;Ll/x20;)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/bn60;->S()V

    .line 67
    .line 68
    .line 69
    :cond_2
    invoke-static {}, Ll/bn60;->N()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 74
    .line 75
    new-instance v2, Ll/fj1;

    .line 76
    .line 77
    const/4 v3, 0x1

    .line 78
    iget-object v4, p0, Ll/sdf0;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 79
    .line 80
    invoke-direct {v2, v0, v3, v4}, Ll/fj1;-><init>(Lcom/p1/mobile/putong/data/PaymentParam;ZLcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v1, v2}, Ll/fp60;->I(Ljava/lang/String;Ll/fj1;)V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 88
    .line 89
    if-ne p1, v0, :cond_7

    .line 90
    .line 91
    iget-boolean v0, p0, Ll/sdf0;->j:Z

    .line 92
    .line 93
    if-eqz v0, :cond_5

    .line 94
    .line 95
    invoke-static {}, Ll/bn60;->N()V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/sdf0;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 99
    .line 100
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_6

    .line 105
    .line 106
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 109
    .line 110
    invoke-virtual {v0}, Ll/joa;->y4()Lrx/c;

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_5
    iget-object v0, p0, Ll/sdf0;->e:Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    new-instance v2, Ll/pdf0;

    .line 117
    .line 118
    invoke-direct {v2}, Ll/pdf0;-><init>()V

    .line 119
    .line 120
    .line 121
    const-wide/16 v3, 0x5dc

    .line 122
    .line 123
    invoke-static {v0, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 124
    .line 125
    .line 126
    :cond_6
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 129
    .line 130
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->B3()V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/sdf0;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 134
    .line 135
    invoke-static {v0, v1}, Ll/fp60;->D(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    :cond_7
    iget-boolean v0, p0, Ll/sdf0;->i:Z

    .line 139
    .line 140
    if-nez v0, :cond_8

    .line 141
    .line 142
    iget-object v0, p0, Ll/sdf0;->h:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 143
    .line 144
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->delayCharge:Z

    .line 145
    .line 146
    if-nez v0, :cond_8

    .line 147
    .line 148
    iget-object v0, p0, Ll/sdf0;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 149
    .line 150
    iget-object v1, p0, Ll/sdf0;->g:Ll/mdf0;

    .line 151
    .line 152
    const-string v2, ""

    .line 153
    .line 154
    iget-boolean v3, p0, Ll/sdf0;->j:Z

    .line 155
    .line 156
    invoke-static {v0, v1, v2, v3}, Ll/fp60;->L(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;Ljava/lang/Object;Z)V

    .line 157
    .line 158
    .line 159
    :cond_8
    iget-object v0, p0, Ll/sdf0;->e:Lcom/p1/mobile/android/app/Act;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 162
    .line 163
    .line 164
    :cond_9
    :goto_1
    invoke-static {}, Ll/odf0;->b()Ll/odf0;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iget-object v1, p0, Ll/sdf0;->g:Ll/mdf0;

    .line 169
    .line 170
    iget-object p0, p0, Ll/sdf0;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 171
    .line 172
    invoke-virtual {v0, v1, p0, p1}, Ll/odf0;->a(Ll/mdf0;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Z

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public l()V
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
    iget-object v3, p0, Ll/sdf0;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    iget-object v3, p0, Ll/sdf0;->h:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

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
    iget-object v2, p0, Ll/sdf0;->e:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    invoke-direct {v0, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Ll/sdf0;->e:Lcom/p1/mobile/android/app/Act;

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
    iget-object v2, p0, Ll/sdf0;->e:Lcom/p1/mobile/android/app/Act;

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
    new-instance v2, Ll/qdf0;

    .line 112
    .line 113
    invoke-direct {v2, p0}, Ll/qdf0;-><init>(Ll/sdf0;)V

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
    new-instance v0, Ll/rdf0;

    .line 127
    .line 128
    invoke-direct {v0, v1}, Ll/rdf0;-><init>(Ll/l4g0;)V

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
    iget-boolean p1, p0, Ll/sdf0;->i:Z

    .line 36
    .line 37
    iget-object p0, p0, Ll/sdf0;->e:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-static {p0}, Ll/bn60;->T(Lcom/p1/mobile/android/app/Act;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sdf0;->k(Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
