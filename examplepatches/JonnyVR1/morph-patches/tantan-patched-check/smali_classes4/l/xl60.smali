.class public Ll/xl60;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static f:J


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public c:Ll/kcg0;

.field public d:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
            ">;>;"
        }
    .end annotation
.end field

.field public e:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xl60;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xl60;->r()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static B(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/wib0;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->J5()Lrx/c;

    .line 20
    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->C3()Lrx/c;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static C(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Ll/mdf0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    iget-object v0, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ib()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "wechat"

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const-string p0, "\u8d26\u53f7\u5df2\u51bb\u7ed3\uff0c\u529f\u80fd\u53d7\u9650"

    .line 22
    .line 23
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    const-string p1, "user block"

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    sget-object p0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 35
    .line 36
    iget-object p3, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 37
    .line 38
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    iget-object p2, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 43
    .line 44
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, p3, p2, p1}, Ll/lib0$a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    sget-object p0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 51
    .line 52
    iget-object p3, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 53
    .line 54
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    iget-object p2, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 59
    .line 60
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, p3, p2, p1}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    const-string v0, "alipay"

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_3

    .line 80
    .line 81
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-nez p1, :cond_2

    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    new-instance p1, Ll/xl60;

    .line 89
    .line 90
    invoke-direct {p1, p0, p3}, Ll/xl60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 91
    .line 92
    .line 93
    new-instance p3, Ll/nop0;

    .line 94
    .line 95
    iget-object v0, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-direct {p3, p0, v0}, Ll/nop0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, p3, p2}, Ll/xl60;->D(Ll/sol;Ll/mdf0;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_3
    new-instance p1, Ll/xl60;

    .line 109
    .line 110
    invoke-direct {p1, p0, p3}, Ll/xl60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 111
    .line 112
    .line 113
    new-instance p3, Ll/qi0;

    .line 114
    .line 115
    iget-object v0, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-direct {p3, p0, v0}, Ll/qi0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, p3, p2}, Ll/xl60;->D(Ll/sol;Ll/mdf0;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_4
    const-string p0, "PaymentParam is null !!!"

    .line 129
    .line 130
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public static E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Ll/mdf0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    iget-object v0, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ib()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "wechat"

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const-string p0, "\u8d26\u53f7\u5df2\u51bb\u7ed3\uff0c\u529f\u80fd\u53d7\u9650"

    .line 22
    .line 23
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    const-string p1, "user block"

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    sget-object p0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 35
    .line 36
    iget-object p3, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 37
    .line 38
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    iget-object p2, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 43
    .line 44
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, p3, p2, p1}, Ll/lib0$a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    sget-object p0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 51
    .line 52
    iget-object p3, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 53
    .line 54
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    iget-object p2, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 59
    .line 60
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, p3, p2, p1}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    const-string v0, "alipay"

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_3

    .line 80
    .line 81
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-nez p1, :cond_2

    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    new-instance p1, Ll/xl60;

    .line 89
    .line 90
    invoke-direct {p1, p0, p3}, Ll/xl60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 91
    .line 92
    .line 93
    new-instance p3, Ll/nop0;

    .line 94
    .line 95
    iget-object v0, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-direct {p3, p0, v0}, Ll/nop0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, p3, p2}, Ll/xl60;->H(Ll/sol;Ll/mdf0;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_3
    new-instance p1, Ll/xl60;

    .line 109
    .line 110
    invoke-direct {p1, p0, p3}, Ll/xl60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 111
    .line 112
    .line 113
    new-instance p3, Ll/qi0;

    .line 114
    .line 115
    iget-object v0, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-direct {p3, p0, v0}, Ll/qi0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, p3, p2}, Ll/xl60;->j(Ll/sol;Ll/mdf0;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_4
    const-string p0, "PaymentParam is null !!!"

    .line 129
    .line 130
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public static synthetic a(Ll/xl60;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xl60;->u(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic b(Ll/xl60;Ll/h2m;Ll/peb0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xl60;->v(Ll/h2m;Ll/peb0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/xl60;Ll/sol;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ll/mdf0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xl60;->t(Ll/sol;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ll/mdf0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/xl60;Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xl60;->w(Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/xl60;Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xl60;->x(Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f(Ll/xl60;Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xl60;->s(Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Ll/xl60;Ll/peb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xl60;->A(Ll/peb0;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

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

.method public static synthetic i(Ll/xl60;Ll/mdf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xl60;->F(Ll/mdf0;)V

    return-void
.end method

.method public static k()Z
    .locals 3

    .line 1
    const-string v0, "com.eg.android.AlipayGphone"

    .line 2
    .line 3
    invoke-static {v0}, Ll/uc60;->a(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->S9:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return v0
.end method

.method public static l()Z
    .locals 1

    .line 1
    const-string v0, "com.eg.android.AlipayGphone"

    .line 2
    .line 3
    invoke-static {v0}, Ll/uc60;->a(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static m()Z
    .locals 2

    .line 1
    const-string v0, "com.jingdong.app.mall"

    .line 2
    .line 3
    invoke-static {v0}, Ll/uc60;->a(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v1, "\u672a\u5b89\u88c5\u4eac\u4e1c"

    .line 10
    .line 11
    invoke-static {v1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return v0
.end method

.method public static n()Z
    .locals 1

    .line 1
    const-string v0, "com.jingdong.app.mall"

    .line 2
    .line 3
    invoke-static {v0}, Ll/uc60;->a(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static o()Z
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/xl60;->f:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0xbb8

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-ltz v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    return v0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    return v0
.end method

.method public static p()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/tencent/mm/opensdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "wxd5aa78216c5e54bc"

    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->registerApp(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    invoke-interface {v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->isWXAppInstalled()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 20
    .line 21
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Y9:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    return v0

    .line 32
    :cond_0
    const/4 v0, 0x1

    .line 33
    return v0
.end method

.method public static q()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/tencent/mm/opensdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "wxd5aa78216c5e54bc"

    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->registerApp(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    invoke-interface {v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->isWXAppInstalled()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    return v0
.end method

.method public static y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/peb0;)V
    .locals 4
    .param p3    # Ll/peb0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p3, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ib()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "alipay"

    .line 18
    .line 19
    const-string v2, "wechat"

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    const-string p0, "\u8d26\u53f7\u5df2\u51bb\u7ed3\uff0c\u529f\u80fd\u53d7\u9650"

    .line 24
    .line 25
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const-string p2, "user block"

    .line 33
    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    sget-object p0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 37
    .line 38
    iget-object p1, p3, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p3, p3, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 45
    .line 46
    iget-object p3, p3, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0, p1, p3, p2}, Ll/lib0$a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_1

    .line 57
    .line 58
    sget-object p0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 59
    .line 60
    iget-object p1, p3, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object p3, p3, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 67
    .line 68
    iget-object p3, p3, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p0, p1, p3, p2}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    sget-object p0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 75
    .line 76
    iget-object p1, p3, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p3, p3, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 83
    .line 84
    iget-object p3, p3, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p0, p1, p3, p2}, Ll/lib0$a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    const/4 v3, -0x1

    .line 102
    sparse-switch v0, :sswitch_data_0

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_0
    const-string v0, "jingdong"

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_3

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_3
    const/4 v3, 0x2

    .line 116
    goto :goto_0

    .line 117
    :sswitch_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-nez p1, :cond_4

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_4
    const/4 v3, 0x1

    .line 125
    goto :goto_0

    .line 126
    :sswitch_2
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-nez p1, :cond_5

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_5
    const/4 v3, 0x0

    .line 134
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :pswitch_0
    new-instance p1, Ll/xl60;

    .line 139
    .line 140
    invoke-direct {p1, p0, p2}, Ll/xl60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 141
    .line 142
    .line 143
    new-instance p2, Ll/kkq;

    .line 144
    .line 145
    iget-object v0, p3, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-direct {p2, p0, v0}, Ll/kkq;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1, p2, p3}, Ll/xl60;->z(Ll/h2m;Ll/peb0;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :pswitch_1
    new-instance p1, Ll/xl60;

    .line 159
    .line 160
    invoke-direct {p1, p0, p2}, Ll/xl60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 161
    .line 162
    .line 163
    new-instance p2, Ll/nop0;

    .line 164
    .line 165
    iget-object v0, p3, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-direct {p2, p0, v0}, Ll/nop0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p1, p2, p3}, Ll/xl60;->z(Ll/h2m;Ll/peb0;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :pswitch_2
    new-instance p1, Ll/xl60;

    .line 179
    .line 180
    invoke-direct {p1, p0, p2}, Ll/xl60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 181
    .line 182
    .line 183
    new-instance p2, Ll/qi0;

    .line 184
    .line 185
    iget-object v0, p3, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/PaymentParam;->getPurchaseTrackId()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-direct {p2, p0, v0}, Ll/qi0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1, p2, p3}, Ll/xl60;->z(Ll/h2m;Ll/peb0;)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_6
    const-string p0, "PaymentParam is null !!!"

    .line 199
    .line 200
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    nop

    .line 205
    :sswitch_data_0
    .sparse-switch
        -0x545695b6 -> :sswitch_2
        -0x2f3174da -> :sswitch_1
        0x773a8ebc -> :sswitch_0
    .end sparse-switch

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final A(Ll/peb0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xl60;->d:Ll/pcj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/lp60;

    .line 6
    .line 7
    iget-object v1, p0, Ll/xl60;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iget-object v2, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    new-instance v3, Ll/nl60;

    .line 12
    .line 13
    invoke-direct {v3, p0}, Ll/nl60;-><init>(Ll/xl60;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3, p1}, Ll/lp60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y20;Ll/peb0;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p1, Ll/peb0;->b:Ll/bn50;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/lp60;->n(Ll/bn50;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/xl60;->d:Ll/pcj;

    .line 25
    .line 26
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lrx/c;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Ll/xl60;->c:Ll/kcg0;

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const-string p0, "retry is null !!!"

    .line 40
    .line 41
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public D(Ll/sol;Ll/mdf0;)V
    .locals 7
    .param p2    # Ll/mdf0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ll/sdf0;

    .line 8
    .line 9
    iget-object v2, p0, Ll/xl60;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object v3, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    move-object v4, p2

    .line 16
    invoke-direct/range {v1 .. v6}, Ll/sdf0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;ZLl/y20;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1, v0}, Ll/sol;->b(Lcom/p1/mobile/putong/core/data/SignPaymentParam;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Ll/sl60;

    .line 24
    .line 25
    invoke-direct {p2, p0, v4, v0}, Ll/sl60;-><init>(Ll/xl60;Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Ll/xl60;->c:Ll/kcg0;

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const-string p0, "Observable<IAgreement> or PaymentParam is null !!!"

    .line 40
    .line 41
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final F(Ll/mdf0;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xl60;->e:Ll/pcj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/sdf0;

    .line 6
    .line 7
    iget-object v2, p0, Ll/xl60;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iget-object v3, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    new-instance v6, Ll/ul60;

    .line 12
    .line 13
    invoke-direct {v6, p0}, Ll/ul60;-><init>(Ll/xl60;)V

    .line 14
    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    move-object v4, p1

    .line 18
    invoke-direct/range {v1 .. v6}, Ll/sdf0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;ZLl/y20;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/xl60;->e:Ll/pcj;

    .line 22
    .line 23
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lrx/c;

    .line 28
    .line 29
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Ll/xl60;->c:Ll/kcg0;

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const-string p0, "retry is null !!!"

    .line 37
    .line 38
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final G()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xl60;->c:Ll/kcg0;

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
    iget-object v0, p0, Ll/xl60;->c:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/xl60;->c:Ll/kcg0;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Ll/xl60;->c:Ll/kcg0;

    .line 24
    .line 25
    return-void
.end method

.method public H(Ll/sol;Ll/mdf0;)V
    .locals 7
    .param p2    # Ll/mdf0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ll/sdf0;

    .line 8
    .line 9
    iget-object v2, p0, Ll/xl60;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object v3, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    move-object v4, p2

    .line 16
    invoke-direct/range {v1 .. v6}, Ll/sdf0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;ZLl/y20;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1, v0}, Ll/sol;->a(Lcom/p1/mobile/putong/core/data/SignPaymentParam;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Ll/tl60;

    .line 24
    .line 25
    invoke-direct {p2, p0, v4, v0}, Ll/tl60;-><init>(Ll/xl60;Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Ll/xl60;->c:Ll/kcg0;

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const-string p0, "Observable<IAgreement> or PaymentParam is null !!!"

    .line 40
    .line 41
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public j(Ll/sol;Ll/mdf0;)V
    .locals 7
    .param p2    # Ll/mdf0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p2, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ll/sdf0;

    .line 8
    .line 9
    iget-object v2, p0, Ll/xl60;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object v3, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    new-instance v6, Ll/ul60;

    .line 14
    .line 15
    invoke-direct {v6, p0}, Ll/ul60;-><init>(Ll/xl60;)V

    .line 16
    .line 17
    .line 18
    const/4 v5, 0x1

    .line 19
    move-object v4, p2

    .line 20
    invoke-direct/range {v1 .. v6}, Ll/sdf0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;ZLl/y20;)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Ll/vl60;

    .line 24
    .line 25
    invoke-direct {p2, p0, p1, v0, v4}, Ll/vl60;-><init>(Ll/xl60;Ll/sol;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ll/mdf0;)V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Ll/xl60;->e:Ll/pcj;

    .line 29
    .line 30
    invoke-interface {p2}, Ll/pcj;->call()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lrx/c;

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Ll/xl60;->c:Ll/kcg0;

    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    const-string p0, "Observable<IAgreement> or PaymentParam is null !!!"

    .line 44
    .line 45
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xl60;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/pl60;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/pl60;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/ql60;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/ql60;-><init>(Ll/xl60;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic s(Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 2
    .line 3
    if-eq p3, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const-string v2, ""

    .line 9
    .line 10
    invoke-static {v0, p1, v2, v1}, Ll/fp60;->L(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;Ljava/lang/Object;Z)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/jdg0;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 20
    .line 21
    iget-object p1, p1, Ll/mdf0;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    const/4 v0, 0x5

    .line 24
    invoke-static {p0, p2, p1, v0, v2}, Ll/fp60;->J(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/core/data/Privilege;ILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-object p3
.end method

.method public final synthetic t(Ll/sol;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ll/mdf0;)Lrx/c;
    .locals 1

    .line 1
    invoke-interface {p1, p2}, Ll/sol;->a(Lcom/p1/mobile/putong/core/data/SignPaymentParam;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/wl60;

    .line 6
    .line 7
    invoke-direct {v0, p0, p3, p2}, Ll/wl60;-><init>(Ll/xl60;Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final synthetic u(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xl60;->G()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v(Ll/h2m;Ll/peb0;)Lrx/c;
    .locals 2

    .line 1
    instance-of v0, p1, Ll/qi0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    sput-wide v0, Ll/xl60;->f:J

    .line 10
    .line 11
    :cond_0
    iget-object p2, p2, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 12
    .line 13
    iget-object p0, p0, Ll/xl60;->a:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/rl60;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/rl60;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p1, p2, v0}, Ll/h2m;->c(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic w(Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 2
    .line 3
    if-eq p3, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const-string v2, ""

    .line 9
    .line 10
    invoke-static {v0, p1, v2, v1}, Ll/fp60;->L(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;Ljava/lang/Object;Z)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/jdg0;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 20
    .line 21
    iget-object p1, p1, Ll/mdf0;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    const/4 v0, 0x5

    .line 24
    invoke-static {p0, p2, p1, v0, v2}, Ll/fp60;->J(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/core/data/Privilege;ILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-object p3
.end method

.method public final synthetic x(Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    .line 2
    .line 3
    if-eq p3, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const-string v2, ""

    .line 9
    .line 10
    invoke-static {v0, p1, v2, v1}, Ll/fp60;->L(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;Ljava/lang/Object;Z)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/jdg0;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 20
    .line 21
    iget-object p1, p1, Ll/mdf0;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    const/4 v0, 0x5

    .line 24
    invoke-static {p0, p2, p1, v0, v2}, Ll/fp60;->J(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/core/data/Privilege;ILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-object p3
.end method

.method public z(Ll/h2m;Ll/peb0;)V
    .locals 4

    .line 1
    new-instance v0, Ll/lp60;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xl60;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/xl60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    new-instance v3, Ll/nl60;

    .line 8
    .line 9
    invoke-direct {v3, p0}, Ll/nl60;-><init>(Ll/xl60;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3, p2}, Ll/lp60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y20;Ll/peb0;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p2, Ll/peb0;->b:Ll/bn50;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/lp60;->n(Ll/bn50;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/ol60;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2}, Ll/ol60;-><init>(Ll/xl60;Ll/h2m;Ll/peb0;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/xl60;->d:Ll/pcj;

    .line 26
    .line 27
    iget-object p1, p2, Ll/peb0;->a:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 28
    .line 29
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 30
    .line 31
    iget-object p2, p0, Ll/xl60;->a:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-static {p2}, Ll/bn60;->U(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->T1:I

    .line 40
    .line 41
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object p0, p0, Ll/xl60;->d:Ll/pcj;

    .line 45
    .line 46
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method
