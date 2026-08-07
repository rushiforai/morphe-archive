.class public final Ll/e3e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u000b\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J%\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u001f\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u001f\u0010\u0011\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0011\u0010\u0010J%\u0010\u0012\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0012\u0010\u000cJ\u001d\u0010\u0013\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J%\u0010\u0015\u001a\u00020\u000e2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0015\u0010\u0017\u001a\u00020\u000e2\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/e3e;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "merchandise",
        "",
        "basePrice",
        "",
        "isPromotion",
        "",
        "f",
        "(Lcom/p1/mobile/putong/core/data/Merchandise;DZ)I",
        "promotion",
        "",
        "d",
        "(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/String;",
        "c",
        "b",
        "e",
        "(Lcom/p1/mobile/putong/core/data/Merchandise;Z)I",
        "a",
        "(Lcom/p1/mobile/putong/core/data/Merchandise;DZ)Ljava/lang/String;",
        "g",
        "(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/e3e;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/e3e;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e3e;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/e3e;->INSTANCE:Ll/e3e;

    .line 7
    .line 8
    return-void
.end method

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
.method public final a(Lcom/p1/mobile/putong/core/data/Merchandise;DZ)Ljava/lang/String;
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p4, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 14
    .line 15
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 16
    .line 17
    :goto_0
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 18
    .line 19
    int-to-double p0, p0

    .line 20
    mul-double/2addr p2, p0

    .line 21
    div-double/2addr v0, p2

    .line 22
    const-wide/high16 p0, 0x4024000000000000L    # 10.0

    .line 23
    .line 24
    mul-double/2addr v0, p0

    .line 25
    const/4 p0, 0x0

    .line 26
    invoke-static {v0, v1, p0}, Ll/q8g0;->F(DI)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    return-object p0
.end method

.method public final b(Lcom/p1/mobile/putong/core/data/Merchandise;DZ)I
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p4, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 14
    .line 15
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 16
    .line 17
    :goto_0
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 18
    .line 19
    int-to-double v2, p0

    .line 20
    mul-double/2addr p2, v2

    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    cmpg-double p4, p2, v2

    .line 24
    .line 25
    if-nez p4, :cond_1

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 30
    .line 31
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 32
    .line 33
    int-to-double p3, p0

    .line 34
    mul-double p2, p1, p3

    .line 35
    .line 36
    :cond_1
    const-wide/high16 p0, 0x3ff0000000000000L    # 1.0

    .line 37
    .line 38
    div-double/2addr v0, p2

    .line 39
    sub-double/2addr p0, v0

    .line 40
    const-wide/high16 p2, 0x4059000000000000L    # 100.0

    .line 41
    .line 42
    mul-double/2addr p0, p2

    .line 43
    invoke-static {p0, p1}, Ll/fhx;->a(D)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0
.end method

.method public final c(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/String;
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 14
    .line 15
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 16
    .line 17
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 20
    .line 21
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 22
    .line 23
    sub-double/2addr p0, v0

    .line 24
    invoke-static {p0, p1}, Ll/fhx;->a(D)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public final d(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/String;
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 14
    .line 15
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 16
    .line 17
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 20
    .line 21
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 22
    .line 23
    div-double/2addr v0, p0

    .line 24
    const-wide/high16 p0, 0x4024000000000000L    # 10.0

    .line 25
    .line 26
    mul-double/2addr v0, p0

    .line 27
    const/4 p0, 0x1

    .line 28
    invoke-static {v0, v1, p0}, Ll/q8g0;->F(DI)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public final e(Lcom/p1/mobile/putong/core/data/Merchandise;Z)I
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 14
    .line 15
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 16
    .line 17
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 20
    .line 21
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 22
    .line 23
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 24
    .line 25
    int-to-double p0, p0

    .line 26
    mul-double/2addr v2, p0

    .line 27
    const-wide/high16 p0, 0x3ff0000000000000L    # 1.0

    .line 28
    .line 29
    div-double/2addr v0, v2

    .line 30
    sub-double/2addr p0, v0

    .line 31
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    .line 32
    .line 33
    mul-double/2addr p0, v0

    .line 34
    invoke-static {p0, p1}, Ll/fhx;->a(D)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/Merchandise;DZ)I
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p4, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 14
    .line 15
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 16
    .line 17
    :goto_0
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 18
    .line 19
    int-to-double p0, p0

    .line 20
    mul-double/2addr p2, p0

    .line 21
    sub-double p0, p2, v0

    .line 22
    .line 23
    div-double/2addr p0, p2

    .line 24
    const-wide/high16 p2, 0x4059000000000000L    # 100.0

    .line 25
    .line 26
    mul-double/2addr p0, p2

    .line 27
    double-to-int p0, p0

    .line 28
    return p0
.end method

.method public final g(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string p0, "lowPrice3Month"

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 v0, 0x1

    .line 11
    const-string v1, "\u7acb\u51cf%.0f\u5143"

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const-string p0, "\u524d3\u6708\u4f18\u60e0"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 27
    .line 28
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 31
    .line 32
    .line 33
    move-result-wide p0

    .line 34
    sub-double/2addr v2, p0

    .line 35
    sget-object p0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 36
    .line 37
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_1
    const-string p0, "lowPriceFirstMonth"

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_3

    .line 61
    .line 62
    const-string p0, "lowPriceCustomerVIP"

    .line 63
    .line 64
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_3

    .line 69
    .line 70
    const-string p0, "lowPriceCustomerSVIP"

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_3

    .line 77
    .line 78
    const-string p0, "lowPriceSVIPPicks"

    .line 79
    .line 80
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-nez p0, :cond_3

    .line 85
    .line 86
    const-string p0, "lowPriceCustomerUpliftSVIP"

    .line 87
    .line 88
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-eqz p0, :cond_2

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    const-string p0, ""

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_3
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-eqz p0, :cond_4

    .line 103
    .line 104
    const-string p0, "\u9996\u6708\u4f18\u60e0"

    .line 105
    .line 106
    return-object p0

    .line 107
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 110
    .line 111
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 112
    .line 113
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 114
    .line 115
    .line 116
    move-result-wide p0

    .line 117
    sub-double/2addr v2, p0

    .line 118
    sget-object p0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 119
    .line 120
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    return-object p0
.end method
