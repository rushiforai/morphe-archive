.class public Ll/cxj;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;

.field public b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cxj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cxj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;

    .line 5
    .line 6
    iget-object p0, p0, Ll/cxj;->b:Ll/y20;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public I(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cxj;->b:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->O7:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cxj;->H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
