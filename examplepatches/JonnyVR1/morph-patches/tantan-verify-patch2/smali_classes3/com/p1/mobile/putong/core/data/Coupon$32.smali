.class Lcom/p1/mobile/putong/core/data/Coupon$32;
.super Lcom/tantanapp/common/data/orm/Column;
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
        "Lcom/tantanapp/common/data/orm/Column<",
        "Lcom/p1/mobile/putong/core/data/Coupon;",
        "Ljava/util/List<",
        "Ljava/lang/Integer;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/Column;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Coupon$32;->get(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public get(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftBenefit;->giveItemIDs:Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public set(Lcom/p1/mobile/putong/core/data/Coupon;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 6
    .line 7
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/GiftBenefit;->giveItemIDs:Ljava/util/List;

    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    check-cast p2, Ljava/util/List;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Coupon$32;->set(Lcom/p1/mobile/putong/core/data/Coupon;Ljava/util/List;)V

    return-void
.end method
