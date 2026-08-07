.class public Ll/d8d0;
.super Ll/s4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/s4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public i(Ll/lq60;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/lq60;->f()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/lq60;->b()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/s4;->q()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 34
    .line 35
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0}, Ll/s4;->q()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/lq60;->a()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->y8:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    filled-new-array {p0, v0, v1}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string v0, "%1$s%2$s %3$s"

    .line 66
    .line 67
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1}, Ll/lq60;->e()Ll/mq60;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1, p0}, Ll/mq60;->l(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    invoke-virtual {p1}, Ll/lq60;->e()Ll/mq60;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1}, Ll/lq60;->a()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->y8:I

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Ll/mq60;->l(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public j(Ll/lq60;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/lq60;->e()Ll/mq60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, ""

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Ll/mq60;->m(Ljava/lang/CharSequence;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public u(Ll/lq60;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/lq60;->f()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/lq60;->f()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    if-ne p0, v0, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/lq60;->b()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public w(Ll/lq60;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/lq60;->f()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/lq60;->f()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    if-ne p0, v0, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/lq60;->b()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method
