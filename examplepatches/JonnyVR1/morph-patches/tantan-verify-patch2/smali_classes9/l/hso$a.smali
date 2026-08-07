.class public Ll/hso$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hso;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/hso;


# direct methods
.method public constructor <init>(Ll/hso;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g(Ll/hso$a;Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hso$a;->l(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V

    return-void
.end method

.method public static synthetic h(Ll/hso$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hso$a;->m(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i(Ll/hso$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hso$a;->k()V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private o()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hso$a;->e:Ll/hso;

    .line 2
    .line 3
    invoke-static {v0}, Ll/hso;->g(Ll/hso;)Ll/kcg0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/hso$a;->e:Ll/hso;

    .line 14
    .line 15
    invoke-static {v0}, Ll/hso;->g(Ll/hso;)Ll/kcg0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/hso$a;->e:Ll/hso;

    .line 26
    .line 27
    invoke-static {v0}, Ll/hso;->g(Ll/hso;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p0, p0, Ll/hso$a;->e:Ll/hso;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {p0, v0}, Ll/hso;->i(Ll/hso;Ll/kcg0;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final synthetic k()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hso$a;->e:Ll/hso;

    .line 2
    .line 3
    invoke-static {p0}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->i7:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hso$a;->n(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 2
    .line 3
    invoke-static {p1}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 11
    .line 12
    invoke-static {p1}, Ll/hso;->e(Ll/hso;)Ll/bn50;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 23
    .line 24
    invoke-static {p1}, Ll/hso;->e(Ll/hso;)Ll/bn50;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p1}, Ll/bn50;->a()V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p0, p0, Ll/hso$a;->e:Ll/hso;

    .line 40
    .line 41
    invoke-static {p0}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->fg(Lcom/p1/mobile/android/app/Act;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/hso$a;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hso$a;->e:Ll/hso;

    .line 5
    .line 6
    invoke-static {v0}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/PaymentApi;->b:Ll/jxd0;

    .line 16
    .line 17
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/hso$a;->e:Ll/hso;

    .line 23
    .line 24
    invoke-static {v0}, Ll/hso;->f(Ll/hso;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    if-ne v0, v1, :cond_0

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v0, v2

    .line 36
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 37
    .line 38
    if-ne p1, v1, :cond_4

    .line 39
    .line 40
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 41
    .line 42
    invoke-static {p1}, Ll/hso;->f(Ll/hso;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Ll/fp60;->C(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 50
    .line 51
    invoke-static {p1}, Ll/hso;->e(Ll/hso;)Ll/bn50;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 62
    .line 63
    invoke-static {p1}, Ll/hso;->e(Ll/hso;)Ll/bn50;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-interface {p1}, Ll/bn50;->c()V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 71
    .line 72
    invoke-static {p1}, Ll/hso;->f(Ll/hso;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object v1, p0, Ll/hso$a;->e:Ll/hso;

    .line 77
    .line 78
    invoke-static {v1}, Ll/hso;->h(Ll/hso;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {p1, v1}, Ll/fp60;->D(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 86
    .line 87
    invoke-static {p1}, Ll/hso;->f(Ll/hso;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 92
    .line 93
    if-ne p1, v1, :cond_2

    .line 94
    .line 95
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 98
    .line 99
    invoke-virtual {p1}, Ll/jan;->N3()Lrx/c;

    .line 100
    .line 101
    .line 102
    :cond_2
    sget-object p1, Ll/ubp;->INSTANCE:Ll/ubp;

    .line 103
    .line 104
    invoke-virtual {p1}, Ll/ubp;->r()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_3

    .line 109
    .line 110
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 111
    .line 112
    invoke-static {p1}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    sget-object v1, Ll/ubp;->a:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {p1, v1, v0}, Ll/ubp;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 119
    .line 120
    .line 121
    :cond_3
    iget-object p0, p0, Ll/hso$a;->e:Ll/hso;

    .line 122
    .line 123
    invoke-static {p0}, Ll/hso;->j(Ll/hso;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 128
    .line 129
    if-eq p1, v0, :cond_6

    .line 130
    .line 131
    sget-object v1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->userCancel:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 132
    .line 133
    if-ne p1, v1, :cond_5

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_5
    return-void

    .line 137
    :cond_6
    :goto_1
    iget-object v1, p0, Ll/hso$a;->e:Ll/hso;

    .line 138
    .line 139
    invoke-static {v1}, Ll/hso;->d(Ll/hso;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_7

    .line 144
    .line 145
    sget-object p0, Ll/ubp;->INSTANCE:Ll/ubp;

    .line 146
    .line 147
    invoke-virtual {p0}, Ll/ubp;->j()V

    .line 148
    .line 149
    .line 150
    if-ne p1, v0, :cond_8

    .line 151
    .line 152
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->V9:I

    .line 153
    .line 154
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 155
    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_7
    iget-object p0, p0, Ll/hso$a;->e:Ll/hso;

    .line 159
    .line 160
    invoke-static {p0}, Ll/hso;->j(Ll/hso;)V

    .line 161
    .line 162
    .line 163
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->V9:I

    .line 164
    .line 165
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 166
    .line 167
    .line 168
    :cond_8
    :goto_2
    const-string p0, "purchase_failed"

    .line 169
    .line 170
    new-array p1, v2, [Ljava/lang/Object;

    .line 171
    .line 172
    invoke-static {p0, p1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 173
    .line 174
    .line 175
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
    invoke-direct {p0}, Ll/hso$a;->o()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 5
    .line 6
    invoke-static {p1}, Ll/hso;->k(Ll/hso;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 10
    .line 11
    invoke-static {p1}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    new-array v0, p1, [Ljava/lang/Object;

    .line 20
    .line 21
    const-string v1, "purchase_failed"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "p_get_privilege_failed"

    .line 27
    .line 28
    new-array p1, p1, [Ll/sfj0$a;

    .line 29
    .line 30
    const-string v1, "e_get_privilege_failed_retry"

    .line 31
    .line 32
    invoke-static {v1, v0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 36
    .line 37
    invoke-static {p1}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ll/dso;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/dso;-><init>(Ll/hso$a;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/hso$a;->e:Ll/hso;

    .line 50
    .line 51
    invoke-static {p1}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object v0, p0, Ll/hso$a;->e:Ll/hso;

    .line 56
    .line 57
    invoke-static {v0}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    instance-of v0, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 62
    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    iget-object v0, p0, Ll/hso$a;->e:Ll/hso;

    .line 66
    .line 67
    invoke-static {v0}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    goto :goto_0

    .line 82
    :cond_0
    const/4 v0, 0x0

    .line 83
    :goto_0
    invoke-static {p1, v0}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_1

    .line 92
    .line 93
    iget-object v0, p0, Ll/hso$a;->e:Ll/hso;

    .line 94
    .line 95
    invoke-static {v0}, Ll/hso;->c(Ll/hso;)Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-interface {p1}, Ll/tvl;->a()Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    new-instance v0, Ll/eso;

    .line 108
    .line 109
    invoke-direct {v0}, Ll/eso;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    new-instance v0, Ll/fso;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Ll/fso;-><init>(Ll/hso$a;)V

    .line 119
    .line 120
    .line 121
    new-instance v1, Ll/gso;

    .line 122
    .line 123
    invoke-direct {v1, p0}, Ll/gso;-><init>(Ll/hso$a;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 131
    .line 132
    .line 133
    :cond_1
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hso$a;->n(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
