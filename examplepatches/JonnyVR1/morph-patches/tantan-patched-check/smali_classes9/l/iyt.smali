.class public Ll/iyt;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;",
        ">;"
    }
.end annotation


# static fields
.field public static d:I = 0x1


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iyt;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 5
    .line 6
    iput-object p2, p0, Ll/iyt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;

    .line 7
    .line 8
    iput-object p3, p0, Ll/iyt;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/iyt;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 5
    .line 6
    iget-object v1, p0, Ll/iyt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;

    .line 7
    .line 8
    iget-object p0, p0, Ll/iyt;->c:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;->c(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->O5:I

    .line 2
    .line 3
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    sget p0, Ll/iyt;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iyt;->H(Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
