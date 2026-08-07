.class public abstract Ll/s4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/g6m<",
        "Ll/lq60;",
        "Ll/mq60;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/lq60;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s4;->g(Ll/lq60;)Ll/mq60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s4;->r(Ll/lq60;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lq60;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lq60;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->f:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/s4;->q()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/z7a;->t0(Lcom/p1/mobile/putong/core/data/Merchandise;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Ll/s4;->l()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/s4;->q()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/s4;->q()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 31
    .line 32
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 33
    .line 34
    :goto_0
    new-instance p0, Ljava/text/DecimalFormat;

    .line 35
    .line 36
    const-string v3, "0.0"

    .line 37
    .line 38
    invoke-direct {p0, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance v3, Ljava/math/BigDecimal;

    .line 42
    .line 43
    int-to-double v4, v0

    .line 44
    div-double/2addr v1, v4

    .line 45
    invoke-direct {v3, v1, v2}, Ljava/math/BigDecimal;-><init>(D)V

    .line 46
    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-virtual {v3, v0, v1}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    .line 55
    .line 56
    .line 57
    move-result-wide v0

    .line 58
    invoke-virtual {p0, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lq60;->d()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final g(Ll/lq60;)Ll/mq60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s4;->a:Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s4;->v(Ll/lq60;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/s4;->a:Ll/lq60;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/s4;->i(Ll/lq60;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Ll/s4;->a:Ll/lq60;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/s4;->t(Ll/lq60;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Ll/s4;->a:Ll/lq60;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/s4;->h(Ll/lq60;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Ll/s4;->a:Ll/lq60;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/s4;->x(Ll/lq60;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    iget-object p1, p0, Ll/s4;->a:Ll/lq60;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/s4;->j(Ll/lq60;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    iget-object p1, p0, Ll/s4;->a:Ll/lq60;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/s4;->z(Ll/lq60;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    iget-object p1, p0, Ll/s4;->a:Ll/lq60;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/s4;->k(Ll/lq60;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/lq60;->e()Ll/mq60;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public h(Ll/lq60;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Ll/lq60;)V
    .locals 0

    .line 1
    return-void
.end method

.method public j(Ll/lq60;)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Ll/lq60;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s4;->a:Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/lq60;->d()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/s4;->o()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/s4;->p()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public n()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lq60;->c()Lcom/p1/mobile/putong/data/PayMethod;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "alipay"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lq60;->d()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->h()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final p()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lq60;->d()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->i()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public q()Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s4;->f()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final r(Ll/lq60;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public s(Ll/lq60;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final t(Ll/lq60;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s4;->s(Ll/lq60;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/lq60;->e()Ll/mq60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/mq60;->f()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

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

.method public u(Ll/lq60;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final v(Ll/lq60;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s4;->u(Ll/lq60;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/lq60;->e()Ll/mq60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/mq60;->e()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

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

.method public w(Ll/lq60;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final x(Ll/lq60;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s4;->w(Ll/lq60;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/lq60;->e()Ll/mq60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/mq60;->g()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

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

.method public y(Ll/lq60;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final z(Ll/lq60;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s4;->y(Ll/lq60;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/s4;->a:Ll/lq60;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/lq60;->e()Ll/mq60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/mq60;->h()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

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
