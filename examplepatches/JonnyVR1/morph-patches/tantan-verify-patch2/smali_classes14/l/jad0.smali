.class public Ll/jad0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;

.field public b:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jad0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;->isEquipped()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput-boolean p1, p0, Ll/jad0;->b:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public H()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jad0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;->isEquipped()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/jad0;->b:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public I()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jad0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;->isEquipped()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/jad0;->b:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public J(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;->k0(Ll/jad0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->d1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jad0;->J(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
