.class public Ll/br60;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static f:Ll/br60;


# instance fields
.field public final a:Ll/wyd0;

.field public b:J

.field public final c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

.field public e:Lcom/p1/mobile/putong/core/data/Merchandise;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wyd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "last_identifier"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, ""

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/br60;->a:Ll/wyd0;

    .line 34
    .line 35
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/br60;->c:Lrx/subjects/a;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Ll/br60;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/br60;->j(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/br60;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/br60;->x(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V

    return-void
.end method

.method public static synthetic c(Ll/br60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/br60;->y(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/br60;Ll/x20;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/br60;->z(Ll/x20;Ll/pf60;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->itemId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic g(Ll/br60;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/br60;->w(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Ljava/util/List;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static m()Ll/br60;
    .locals 2

    .line 1
    sget-object v0, Ll/br60;->f:Ll/br60;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/br60;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/br60;->f:Ll/br60;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/br60;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/br60;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/br60;->f:Ll/br60;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/br60;->f:Ll/br60;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public A()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->A2:Ll/e8a;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/e8a;->d3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/xq60;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/xq60;-><init>(Ll/br60;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/yq60;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/yq60;-><init>(Ll/br60;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public B()V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    mul-long/2addr v0, v2

    .line 9
    const-wide/32 v2, 0x1b7740

    .line 10
    .line 11
    .line 12
    add-long/2addr v0, v2

    .line 13
    iput-wide v0, p0, Ll/br60;->b:J

    .line 14
    .line 15
    return-void
.end method

.method public C()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/br60;->d:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

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
    iget-object v0, p0, Ll/br60;->e:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/br60;->d:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 18
    .line 19
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->remainingTime:J

    .line 20
    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    cmp-long p0, v0, v2

    .line 24
    .line 25
    if-lez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final D(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 p0, 0x9

    .line 2
    .line 3
    if-le p1, p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v0, "0"

    .line 13
    .line 14
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "wechat"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/xl60;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    sget-object p0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 16
    .line 17
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 20
    .line 21
    const-string p2, "wx not install"

    .line 22
    .line 23
    invoke-virtual {p0, p5, p1, p2}, Ll/lib0$a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {}, Ll/xl60;->k()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    sget-object p0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 34
    .line 35
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 38
    .line 39
    const-string p2, "alipay not install"

    .line 40
    .line 41
    invoke-virtual {p0, p5, p1, p2}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    new-instance v1, Ll/wn60;

    .line 46
    .line 47
    const-string v2, ""

    .line 48
    .line 49
    invoke-direct {v1, p3, p1, p8, v2}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p5}, Ll/wn60;->C(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p6, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/br60;->v(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    invoke-static {p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    invoke-static {}, Ll/pzi0;->o()J

    .line 70
    .line 71
    .line 72
    move-result-wide v2

    .line 73
    iget-wide v4, p7, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 74
    .line 75
    long-to-double v2, v2

    .line 76
    sub-double/2addr v4, v2

    .line 77
    const-wide/16 v2, 0x0

    .line 78
    .line 79
    cmpl-double p1, v4, v2

    .line 80
    .line 81
    if-lez p1, :cond_2

    .line 82
    .line 83
    iget-object p1, p7, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v1, p1}, Ll/wn60;->r(Ljava/lang/String;)Ll/wn60;

    .line 86
    .line 87
    .line 88
    :cond_2
    iget-object p1, p6, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/br60;->v(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-nez p0, :cond_3

    .line 95
    .line 96
    const/4 p0, 0x0

    .line 97
    invoke-virtual {v1, p0}, Ll/wn60;->D(Z)V

    .line 98
    .line 99
    .line 100
    :cond_3
    const-string p0, "pendingPaymentGuide"

    .line 101
    .line 102
    invoke-virtual {v1, p0}, Ll/wn60;->A(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p6, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->discountToken:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-nez p0, :cond_4

    .line 112
    .line 113
    iget-object p0, p6, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->discountToken:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v1, p0}, Ll/wn60;->u(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_4
    iget-object p0, p6, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->method:Ljava/lang/String;

    .line 119
    .line 120
    const-string p1, "create-order"

    .line 121
    .line 122
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-eqz p0, :cond_5

    .line 127
    .line 128
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 129
    .line 130
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    invoke-virtual {v1, p0, p1, p9}, Ll/wn60;->o(Ljava/lang/String;ZLl/y20;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_5
    iget-object p0, p6, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->method:Ljava/lang/String;

    .line 141
    .line 142
    const-string p1, "sign"

    .line 143
    .line 144
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    const/4 p1, 0x1

    .line 149
    if-eqz p0, :cond_6

    .line 150
    .line 151
    invoke-virtual {v1, p1}, Ll/wn60;->w(Z)V

    .line 152
    .line 153
    .line 154
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 159
    .line 160
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v1, p0, p1, p9}, Ll/wn60;->I(ZLjava/lang/String;Ll/y20;)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_6
    iget-object p0, p6, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->method:Ljava/lang/String;

    .line 167
    .line 168
    const-string p3, "signAndPay"

    .line 169
    .line 170
    invoke-static {p0, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    if-eqz p0, :cond_7

    .line 175
    .line 176
    invoke-virtual {v1, p1}, Ll/wn60;->x(Z)V

    .line 177
    .line 178
    .line 179
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 184
    .line 185
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v1, p0, p1, p9}, Ll/wn60;->I(ZLjava/lang/String;Ll/y20;)V

    .line 188
    .line 189
    .line 190
    :cond_7
    return-void
.end method

.method public F(Ll/ner;Ll/x20;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->A2:Ll/e8a;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/e8a;->d3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/uq60;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/uq60;-><init>(Ll/br60;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {p1, v0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ll/vq60;

    .line 23
    .line 24
    invoke-direct {v0, p0, p2}, Ll/vq60;-><init>(Ll/br60;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/wq60;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/wq60;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public G(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/br60;->b:J

    .line 2
    .line 3
    return-void
.end method

.method public H(Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/br60;->v(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const-string p0, "alipay"

    .line 32
    .line 33
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 40
    .line 41
    if-eq p3, p0, :cond_0

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public final h(Ll/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 4
    .line 5
    iput-object v0, p0, Ll/br60;->d:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 6
    .line 7
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    iput-object p1, p0, Ll/br60;->e:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 12
    .line 13
    iget-object p0, p0, Ll/br60;->c:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/usa;->y3()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->discountToken:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/br60;->a:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/CharSequence;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->discountToken:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/usa;->N3()Lrx/c;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/br60;->a:Ll/wyd0;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->discountToken:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/br60;->i(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->productType:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/zq60;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/zq60;-><init>(Ll/br60;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    invoke-static {p0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public k(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    const-string p0, "contractSuccessPayFailManyTimes"

    .line 2
    .line 3
    invoke-static {p3, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 p3, 0x1

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p2, p3}, Ll/bn60;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-static {p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-static {p3}, Ll/bn60;->Q(Z)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-static {p1, p0}, Ll/bn60;->A(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/CharSequence;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_1
    invoke-static {p2}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-static {p2, p3}, Ll/bn60;->G(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_2
    invoke-static {p2}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    invoke-static {p2, p3}, Ll/bn60;->G(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :cond_3
    invoke-static {p2, p3}, Ll/bn60;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method public l(J)Ll/pf60;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr p1, v0

    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long v0, p1, v0

    .line 9
    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    new-instance p0, Ll/pf60;

    .line 13
    .line 14
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    const-string p2, "00:00"

    .line 17
    .line 18
    invoke-direct {p0, p1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-wide/32 v0, 0x5265c00

    .line 23
    .line 24
    .line 25
    cmp-long v2, p1, v0

    .line 26
    .line 27
    if-lez v2, :cond_1

    .line 28
    .line 29
    div-long/2addr p1, v0

    .line 30
    long-to-int p0, p1

    .line 31
    new-instance p1, Ll/pf60;

    .line 32
    .line 33
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, "\u5929"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-direct {p1, p2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    return-object p1

    .line 56
    :cond_1
    const-wide/32 v0, 0x36ee80

    .line 57
    .line 58
    .line 59
    cmp-long v2, p1, v0

    .line 60
    .line 61
    if-lez v2, :cond_2

    .line 62
    .line 63
    div-long/2addr p1, v0

    .line 64
    long-to-int p0, p1

    .line 65
    new-instance p1, Ll/pf60;

    .line 66
    .line 67
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 68
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p0, "\u65f6"

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-direct {p1, p2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    return-object p1

    .line 90
    :cond_2
    const-wide/32 v0, 0xea60

    .line 91
    .line 92
    .line 93
    div-long v2, p1, v0

    .line 94
    .line 95
    long-to-int v2, v2

    .line 96
    rem-long/2addr p1, v0

    .line 97
    const-wide/16 v0, 0x3e8

    .line 98
    .line 99
    div-long/2addr p1, v0

    .line 100
    long-to-int p1, p1

    .line 101
    new-instance p2, Ll/pf60;

    .line 102
    .line 103
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 104
    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, v2}, Ll/br60;->D(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v2, ":"

    .line 118
    .line 119
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, p1}, Ll/br60;->D(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-direct {p2, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    return-object p2
.end method

.method public n(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "tttVip"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "svip"

    .line 23
    .line 24
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ie()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    const-string p0, "oDiamond"

    .line 44
    .line 45
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->F0()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y3()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public o()Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/br60;->e:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/br60;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public q()Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/br60;->d:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/br60;->v(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p2}, Ll/tab0;->x(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-static {p3}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public s(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/br60;->v(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "payment_pending"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "contractSuccessPayFail"

    .line 11
    .line 12
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const-string p0, "payment_balance"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const-string p0, "payment_coupon"

    .line 22
    .line 23
    return-object p0
.end method

.method public t(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/br60;->v(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const-string p0, "p_chat,assistant_buybutton_pending"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "p_navigation,privilege_button_pending"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "contractSuccessPayFail"

    .line 16
    .line 17
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_3

    .line 22
    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    const-string p0, "p_chat,assistant_buybutton_balance"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const-string p0, "p_navigation,privilege_button_balance"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_3
    if-eqz p2, :cond_4

    .line 32
    .line 33
    const-string p0, "p_chat,assistant_buybutton_coupon"

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_4
    const-string p0, "p_navigation,privilege_button_coupon"

    .line 37
    .line 38
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/pta;->r()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "contractSuccessPayFailManyTimes"

    .line 14
    .line 15
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public v(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "pendingOrder"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "pendingContract"

    .line 10
    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-string p0, "pendingContractAndPay"

    .line 18
    .line 19
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Ljava/util/List;)Ll/pf60;
    .locals 1

    .line 1
    new-instance v0, Ll/ar60;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ar60;-><init>(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 11
    .line 12
    iput-object p2, p0, Ll/br60;->e:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 13
    .line 14
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->endTime:J

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ll/br60;->G(J)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/br60;->i(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/br60;->B()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic y(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/br60;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Ll/x20;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/br60;->h(Ll/pf60;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
