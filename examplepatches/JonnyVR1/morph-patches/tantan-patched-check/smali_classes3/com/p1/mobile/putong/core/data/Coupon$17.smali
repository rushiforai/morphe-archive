.class Lcom/p1/mobile/putong/core/data/Coupon$17;
.super Lcom/tantanapp/common/data/orm/StringColumn;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Coupon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/StringColumn<",
        "Lcom/p1/mobile/putong/core/data/Coupon;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Coupon$17;->get(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public get(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/TrialBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Discount;->discountType:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public set(Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/TrialBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/Discount;->discountType:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Coupon$17;->set(Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;)V

    return-void
.end method
